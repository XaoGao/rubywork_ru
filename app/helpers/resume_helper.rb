module ResumeHelper
  def get_user_name(resume)
    User.find(resume.user_id).name
  end
end
