## DENTAL OFFICE SPIKE
# There's a dental office called Dental People Inc.  Within this office, there's 2 oral surgeons, 2 orthodontists, 1 general dentist.
# Both general dentists and oral surgeons can pull teeth. Orthodontists cannot pull teeth.  Orthodontists straighten teeth.
# All of these aforementioned specialties are dentists. All dentists graduated from dental school.  Oral surgeons place implants.
# General dentists fill teeth

=begin
- Nouns
  - DentalPeopleInc
  - Dentist
    - graduated
  - OralSurgeons
    - place_implant
    - pull_teeth
  - Orthodontist
    - straighten_teeth
  - GeneralDentist
    - pull_teeth
    - fill_teeth
=end
module Pullable
  def pull_teeth 
  end
end

class Dentist
  def initialize
    @graduate = "Dental School"
  end
end

class OralSurgeons < Dentist
  include Pullable

  def place_implant
  end
end

class Orthodontist < Dentist
  def straighten_teeth
  end
end

class GeneralDentist < Dentist
  include Pullable

  def fill_teeth
  end
endß