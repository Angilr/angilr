# frozen_string_literal: true

# Field Actions
class Admin::FieldsController < Admin::ApplicationController
  def index
    @fields = Field.order(:id)
  end

  def new
    @field = Field.new
  end

  def create
    @field = Field.new field_params
    if @field.save
      redirect_to admin_fields_path, notice: 'Đã thêm lĩnh vực mới'
    else
      flash.now[:alert] = 'Không thêm được lĩnh vực'
      render :new
    end
  end

  private

  def field_params
    params.require(:field).permit(:name)
  end
end
