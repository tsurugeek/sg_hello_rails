class WithLengthInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    s = super(wrapper_options)
    raw "#{s} (最大#{limit}文字)"
  end
end
