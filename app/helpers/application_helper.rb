module ApplicationHelper

  def present(object, klass=nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  def errors_for(obj)
    if obj.errors.any?
      render :partial => 'shared/form_errors', :locals => {:record => obj}
    end
  end

end
