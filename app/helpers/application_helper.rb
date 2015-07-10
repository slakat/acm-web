module ApplicationHelper

 def to_pretty s
    a = (Time.now-s).to_i
    case a
      when 0>a  then s.strftime "%d-%m-%Y"
      when 0 then 'justo ahora'
      when 1 then 'un segundo atrás'
      when 2..59 then a.to_s+' hace segundos' 
      when 60..119 then 'hace un minuto' #120 = 2 minutes
      when 120..3540 then (a/60).to_i.to_s+' minutos atrás'
      when 3541..7100 then 'una hora atrás' # 3600 = 1 hour
      when 7101..82800 then ((a+99)/3600).to_i.to_s+' horas atrás' 
      when 82801..172000 then 'un día atrás' # 86400 = 1 day
      when 172001..518400 then ((a+800)/(60*60*24)).to_i.to_s+' días atrás'
      when 518400..1036800 then 'hace una semana'
      else ((a+180000)/(60*60*24*7)).to_i.to_s+' semanas atrás'
    end
  end

  def state_event s
     a = (Time.now-s).to_i
    case a
      when 0>a  then '<span class="soon">Pronto</span>'.html_safe
      else '<span class="old">Realizado</span>'.html_safe
    end
  end

  def old_active s
     a = (Time.now-s).to_i
     case a
     when 0>a then 'event-soon'
    else  'event-old'
    end
  end

  def round_image *args
    "<div class=\"round-img\">#{image_tag(*args)}</div>".html_safe
  end
end
