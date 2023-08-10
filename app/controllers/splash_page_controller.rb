class SplashPageController < ApplicationController
  include ShopifyApp::EmbeddedApp
  include ShopifyApp::EnsureInstalled
  include ShopifyApp::ShopAccessScopesVerification

  def index
    @shop_origin = current_shopify_domain
    @loading_path = params[:id].present? ? order_path(params[:id]) : (params[:return_to] || home_path)
  end
end
