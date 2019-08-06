class Sessions
  #logs a user in
  def self.log_in(student, session)
    session[:student_id] = student.id
  end

  def self.current_student(session)
    @student ||= Student.find_by(id: session[:student_id])
  end

  def self.is_logged_in?(session)
    !session[:student_id].nil?
  end

  def self.log_out(session)
    session.clear
  end
    
end