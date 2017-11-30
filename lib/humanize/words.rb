# -*- encoding: utf-8 -*-
module Humanize
  WORDS = {
    :de => {
      :group_by => 1_000,
      :infinity => 'Unendlich',
      :undefined => 'undefiniert',
      :negative => 'negativ',
      :zero => 'null',
      :point => 'Punkt',
      :and => 'und',
      :comma => ''
    },
    :en => {
      :group_by => 1_000,
      :infinity => 'infinity',
      :undefined => 'undefined',
      :negative => 'negative',
      :zero => 'zero',
      :point => 'point',
      :and => 'and',
      :comma => ','
    },
    :fr => {
      :group_by => 1_000,
      :infinity => 'infini', # needs verification
      :undefined => 'indéfini', # needs verification
      :negative => 'négatif',
      :zero => 'zéro',
      :point => 'virgule',
      :and => '',
      :comma => ''
    },
    :tr => {
      :group_by => 1_000,
      :infinity => 'sonsuzluk', # needs verification
      :undefined => 'tanımsız', # needs verification
      :negative => 'eksi',
      :zero => 'sıfır',
      :point => 'virgül',
      :and => '',
      :comma => ''
    },
    :id => {
      :group_by => 1_000,
      :infinity => 'tak terhingga',
      :undefined => 'tak terdefinisi',
      :negative => 'minus',
      :zero => 'nol',
      :point => 'koma',
      :and => '',
      :comma => ''
    }
  }
end
