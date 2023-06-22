prawn_document do |pdf|
  pdf.text 'LISTANDO ASSUNTOS', :align => :center
  pdf.move_down 20
  pdf.table @subjects.collect{|s| [s.id,s.description]}, :position => :center
end