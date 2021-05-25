class Public::LiveOrganizationsController < ApplicationController
  def create
  end

  def new
  end

  def index
    @user = current_user
    @live_organizations = LiveOrganization.all
  end

  def show
  end

  def edit
  end

  def destroy
  end
end
