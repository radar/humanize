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
      :infinity => 'infini',    # Needs verification from native french speaker. Send
      :undefined => 'indéfini', # PR to correct (if wrong) and remove these 2 line comments.
      :negative => 'négatif',
      :zero => 'zéro',
      :point => 'virgule',
      :and => '',
      :comma => ''
    },
    :az => {
      :group_by => 1_000,
      :infinity => 'sonsuz',
      :undefined => 'undefined',
      :negative => 'mənfi',
      :zero => 'sıfır',
      :point => 'vergül',
      :and => '',
      :comma => ''
    },
    :tr => {
      :group_by => 1_000,
      :infinity => 'sonsuz',
      :undefined => 'tanımsız',
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
    },
    :th => {
      :group_by => [100, 10],
      :infinity => 'infinity',
      :undefined => 'undefined',
      :negative => 'ลบ',
      :zero => 'ศูนย์',
      :point => 'จุด',
      :and => 'และ',
      :comma => '',
      :nowordspacing => true
    },
  }
end
