require_dependency "vipload/application_controller"

module Vipload
  class UploadController < ApplicationController
    def create
      vipload = YAML.load_file("#{Rails.root}/config/vipload.yml")[Rails.env]
      require "net/ftp"
      
      ftp = Net::FTP.new(vipload["server"], vipload["username"], vipload["password"])
      key = params[:key].gsub(/\/$/, "").gsub(/$\//, "")
      filename = params[:file].original_filename
      filename = params[:filename] if params[:filename] && !params[:filename].blank?
      tmp_path = []
      
      key.split("/").each do |folder|
        tmp_path.push folder
        ftp.mkdir(tmp_path.join("/"))
      end

      ftp.putbinaryfile(params[:file].tempfile, [params[:key], filename].join("/"))

      respond_to do |format|
        if params[:redirect]
          format.html { redirect_to params[:redirect] }
        else
          format.html { render text: ftp.last_response }
        end
      end
    end
  end
end
