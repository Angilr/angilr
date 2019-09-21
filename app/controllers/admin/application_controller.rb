# frozen_string_literal: true

# Common Controller for Admin
class Admin::ApplicationController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin!
end
