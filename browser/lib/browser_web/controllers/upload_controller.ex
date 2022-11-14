defmodule BrowserWeb.UploadController do
  use BrowserWeb, :controller

  alias Dogs.Dog

  def new(conn, _params) do
    changeset = Upload.changeset(%Dog{})

    render(conn, "form.html", changeset: changeset)
  end

  def create(conn, %{"upload" => %{"image" => image_params} = upload_params}, %{"id" => id}) do
    file_uuid = UUID.uuid4(:hex)
    image_filename = image_params.filename
    unique_filename = "#{file_uuid}-#{image_filename}"
    {:ok, image_binary} = File.read(image_params.path)

    bucket_name = {:system, "AWS_BUCKET_NAME"}

    image =
      ExAws.S3.put_object(bucket_name, unique_filename, image_binary)
      |> ExAws.request!()

    # build the image url and add to the params to be stored
    updated_params =
      upload_params
      |> Map.update(image, image_params, fn _value ->
        "https://#{bucket_name}.s3.amazonaws.com/#{bucket_name}/#{unique_filename}"
      end)

    changeset = Upload.changeset(%Dog{}, updated_params)
    post = Dogs.get_post!(id)

    case Repo.insert!(changeset) do
      {:ok, Dog} ->
        conn
        |> put_flash(:info, "Image uploaded successfully!")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
