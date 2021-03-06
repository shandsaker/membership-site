class MembershipsController < ApplicationController

  def new
    render locals: {registration_form: registration_form}
  end

  def create
    if registration_form.save
      flash[:notice] = "Payment Complete.  Welcome to Startup Victoria!"
      redirect_to coupons_path
    else
      render :new, locals: {registration_form: registration_form}
    end
  end

  private

  def registration_form
    @_form ||= MembershipRegistrationForm.new(registration_params.merge(
      authenticator: authenticator
    ))
  end

  def registration_params
    params.fetch(:membership_registration_form, {}).permit(
      :full_name,
      :email,
      :password,
      :card_token
    )
  end

  def triplets
    [
      [ true,  true,  "Regular email and blog updates" ],
      [ true,  true,  "Access to content on our membership site" ],
      [ true,  true,  "A member profile" ],
      [ true,  true,  "Access to peer networking events" ],
      [ true,  true,  "Participate in virtual office hours" ],
      [ true,  true,  "Participate in Startup Victoria board elections" ],
      [ true,  true,  "Early access to special offers and event tickets" ],
      [ false, true,  "2 individual memberships included in business membership fee" ],
      [ true,  true,  "Discounted tickets to Startup Victoria events and workshops" ],
      [ true,  false, "Exclusive discounts on products and services for your business" ],
      [ true,  true,  "Opportunities to share content with our membership base" ],
      [ false, true,  "Offer discounted products/services to our membership base" ],
      [ true,  false, "Participate in virtual office hours or mentorship programs" ]
    ].map do |a|
      { premium: a[0], business: a[1], feature: a[2] }
    end
  end
  helper_method :triplets

end
