ActiveAdmin.register Course do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  permit_params :mover_id, :customer_id, :accepted_at, :course_start_time, :travel_start_time,
    :travel_end_time, :course_end_time, :mover_rating, :created_at, :updated_at

end
