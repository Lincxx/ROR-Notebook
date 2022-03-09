ActiveAdmin.register Subject do
  # ActiveModel::ForbiddenAttributesError
  #   Extracted source (around line #23):
  #     def sanitize_for_mass_assignment(attributes)
  #       if attributes.respond_to?(:permitted?)
  #         # ERROR LINE
  #         raise ActiveModel::ForbiddenAttributesError if !attributes.permitted?
  #         attributes.to_h
  #       else
  #         attributes


  permit_params :name, note_ids: []
  
  # custom page
  show title: "My Title" do
    h3 'You have ' + pluralize(subject.notes.count, 'note') + ' for this subject'
    subject.notes.each do |note|
      h1 note.link
      h4 link_to "[{#note.id}]: You created this note on #{note.created_at.strftime('%a %b %e %Y at %I%M %p')}", admin_note_path(note)
    end
  end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
