if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'staff_members').blank?
      user.plugins.create(:name => 'staff_members',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Staff Members',
    :link_url => '/staff_members',
    :deletable => false,
    :position => 2,
    :menu_match => '^/staff_members(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end

# load data

IMAGE_PATH  = "#{Rails.root}/public/images/staff".freeze

images = Dir["#{IMAGE_PATH}/*.{jpg,JPG}"]

images.each do |img|
  name  = File.basename(img, '.jpg')
  email = "#{name.gsub(/\s/, '_')}@notes.k12.hi.us".downcase
  image = Image.create!(:image => File.new(img))

  f, l = name.split(/\s+/)
  if StaffMember.where(:first_name => f, :last_name => l).empty?
    p StaffMember.create!(:first_name => f, :last_name => l, :email => email, :photo_id => image.id)
  end
end

