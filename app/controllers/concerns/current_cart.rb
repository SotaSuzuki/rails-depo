module CurrentCart
  private
    def set_cart
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end

  protected
    def increment_counter
      session[:counter] = 0 if session[:counter].nil?
      session[:counter] += 1
    end
end
