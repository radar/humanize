# -*- encoding: utf-8 -*-
module Humanize
  WORDS = {
    :de => {
      :group_by => 1_000,
      :negative => 'negativ',
      :zero => 'null',
      :point => 'Punkt',
      :and => 'und',
      :comma => ''
    },
    :en => {
      :group_by => 1_000,
      :negative => 'negative',
      :zero => 'zero',
      :point => 'point',
      :and => 'and',
      :comma => ','
    },
    :fr => {
      :group_by => 1_000,
      :negative => 'négatif',
      :zero => 'zéro',
      :point => 'virgule',
      :and => '',
      :comma => ''
    },
    :tr => {
      :group_by => 1_000,
      :negative => 'eksi',
      :zero => 'sıfır',
      :point => 'virgül',
      :and => '',
      :comma => ''
    },
    :id => {
      :group_by => 1_000,
      :negative => 'minus',
      :zero => 'nol',
      :point => 'koma',
      :and => '',
      :comma => ''
    }
  }
end
