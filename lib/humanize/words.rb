# -*- encoding: utf-8 -*-
module Humanize
  WORDS = {
    :de => {
      :negative => 'negativ',
      :zero => 'null',
      :point => 'Punkt',
      :and => 'und',
      :comma => ''
    },
    :en => {
      :negative => 'negative',
      :zero => 'zero',
      :point => 'point',
      :and => 'and',
      :comma => ','
    },
    :fr => {
      :negative => 'négatif',
      :zero => 'zéro',
      :point => 'virgule',
      :and => '',
      :comma => ''
    },
    :tr => {
      :negative => 'eksi',
      :zero => 'sıfır',
      :point => 'virgül',
      :and => '',
      :comma => ''
    }
  }
end
