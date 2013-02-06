module ContenidosHelper
  def markitup
    txt = <<javascript
    
    $(document).ready(function()	{
        $('#markdown').markItUp(myMarkdownSettings);
    });

javascript
  end
end
