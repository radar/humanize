# frozen_string_literal: true

module Humanize
  class Ru
    INFINITY = 'бесконечность'
    UNDEFINED = 'неопределенность'
    NEGATIVE = 'минус'
    POINT = ','
    LOTS = [nil, 'тысяч', 'миллионов', 'миллиардов', 'триллионов', 'квадриллионов', 'квинтиллионов', 'секстиллионов', 'септиллионов', 'октиллионов', 'нониллионов', 'дециллионов', 'андециллионов', 'ауодециллионов', 'тредециллионов', 'кваттордециллионов', 'квиндециллионов', 'сексдециллионов', 'септемдециллионов', 'октодециллионов', 'новемдециллионов', 'вигинтиллионов', 'анвигинтиллионов', 'дуовигинтиллионов', 'тревигинтиллионов', 'кватторвигинтиллионов', 'квинвигинтиллионов', 'сексвигинтиллионов', 'септемвигинтиллионов', 'октовигинтиллионов', 'новемвигинтиллионов', 'тригинтиллионов', 'антригинтиллионов', 'гуголов'].freeze
    SPECIFIC_LOTS = [
      ['один тысяч', 'одна тысяча'], ['два тысяч', 'две тысячи'], ['три тысяч', 'три тысячи'], ['четыре тысяч', 'четыре тысячи'], ['один миллионов', 'один миллион'], ['два миллионов', 'два миллиона'], ['три миллионов', 'три миллиона'], ['четыре миллионов', 'четыре миллиона'], ['один миллиардов', 'один миллиард'], ['два миллиардов', 'два миллиарда'], ['три миллиардов', 'три миллиарда'], ['четыре миллиардов', 'четыре миллиарда'], ['один триллионов', 'один триллион'], ['два триллионов', 'два триллиона'], ['три триллионов', 'три триллиона'], ['четыре триллионов', 'четыре триллиона'], ['один квадриллионов', 'один квадриллион'], ['два квадриллионов', 'два квадриллиона'], ['три квадриллионов', 'три квадриллиона'], ['четыре квадриллионов', 'четыре квадриллиона'], ['один квинтиллионов', 'один квинтиллион'], ['два квинтиллионов', 'два квинтиллиона'], ['три квинтиллионов', 'три квинтиллиона'], ['четыре квинтиллионов', 'четыре квинтиллиона'], ['один секстиллионов', 'один секстиллион'], ['два секстиллионов', 'два секстиллиона'], ['три секстиллионов', 'три секстиллиона'], ['четыре секстиллионов', 'четыре секстиллиона'], ['один септиллионов', 'один септиллион'], ['два септиллионов', 'два септиллиона'], ['три септиллионов', 'три септиллиона'], ['четыре септиллионов', 'четыре септиллиона'], ['один октиллионов', 'один октиллион'], ['два октиллионов', 'два октиллиона'], ['три октиллионов', 'три октиллиона'], ['четыре октиллионов', 'четыре октиллиона'], ['один нониллионов', 'один нониллион'], ['два нониллионов', 'два нониллиона'], ['три нониллионов', 'три нониллиона'], ['четыре нониллионов', 'четыре нониллиона'], ['один дециллионов', 'один дециллион'], ['два дециллионов', 'два дециллиона'], ['три дециллионов', 'три дециллиона'], ['четыре дециллионов', 'четыре дециллиона'], ['один андециллионов', 'один андециллион'], ['два андециллионов', 'два андециллиона'], ['три андециллионов', 'три андециллиона'], ['четыре андециллионов', 'четыре андециллиона'], ['один ауодециллионов', 'один ауодециллион'], ['два ауодециллионов', 'два ауодециллиона'], ['три ауодециллионов', 'три ауодециллиона'], ['четыре ауодециллионов', 'четыре ауодециллиона'], ['один тредециллионов', 'один тредециллион'], ['два тредециллионов', 'два тредециллиона'], ['три тредециллионов', 'три тредециллиона'], ['четыре тредециллионов', 'четыре тредециллиона'], ['один кваттордециллионов', 'один кваттордециллион'], ['два кваттордециллионов', 'два кваттордециллиона'], ['три кваттордециллионов', 'три кваттордециллиона'], ['четыре кваттордециллионов', 'четыре кваттордециллиона'], ['один квиндециллионов', 'один квиндециллион'], ['два квиндециллионов', 'два квиндециллиона'], ['три квиндециллионов', 'три квиндециллиона'], ['четыре квиндециллионов', 'четыре квиндециллиона'], ['один сексдециллионов', 'один сексдециллион'], ['два сексдециллионов', 'два сексдециллиона'], ['три сексдециллионов', 'три сексдециллиона'], ['четыре сексдециллионов', 'четыре сексдециллиона'], ['один септемдециллионов', 'один септемдециллион'], ['два септемдециллионов', 'два септемдециллиона'], ['три септемдециллионов', 'три септемдециллиона'], ['четыре септемдециллионов', 'четыре септемдециллиона'], ['один октодециллионов', 'один октодециллион'], ['два октодециллионов', 'два октодециллиона'], ['три октодециллионов', 'три октодециллиона'], ['четыре октодециллионов', 'четыре октодециллиона'], ['один новемдециллионов', 'один новемдециллион'], ['два новемдециллионов', 'два новемдециллиона'], ['три новемдециллионов', 'три новемдециллиона'], ['четыре новемдециллионов', 'четыре новемдециллиона'], ['один вигинтиллионов', 'один вигинтиллион'], ['два вигинтиллионов', 'два вигинтиллиона'], ['три вигинтиллионов', 'три вигинтиллиона'], ['четыре вигинтиллионов', 'четыре вигинтиллиона'], ['один анвигинтиллионов', 'один анвигинтиллион'], ['два анвигинтиллионов', 'два анвигинтиллиона'], ['три анвигинтиллионов', 'три анвигинтиллиона'], ['четыре анвигинтиллионов', 'четыре анвигинтиллиона'], ['один дуовигинтиллионов', 'один дуовигинтиллион'], ['два дуовигинтиллионов', 'два дуовигинтиллиона'], ['три дуовигинтиллионов', 'три дуовигинтиллиона'], ['четыре дуовигинтиллионов', 'четыре дуовигинтиллиона'], ['один тревигинтиллионов', 'один тревигинтиллион'], ['два тревигинтиллионов', 'два тревигинтиллиона'], ['три тревигинтиллионов', 'три тревигинтиллиона'], ['четыре тревигинтиллионов', 'четыре тревигинтиллиона'], ['один кватторвигинтиллионов', 'один кватторвигинтиллион'], ['два кватторвигинтиллионов', 'два кватторвигинтиллиона'], ['три кватторвигинтиллионов', 'три кватторвигинтиллиона'], ['четыре кватторвигинтиллионов', 'четыре кватторвигинтиллиона'], ['один квинвигинтиллионов', 'один квинвигинтиллион'], ['два квинвигинтиллионов', 'два квинвигинтиллиона'], ['три квинвигинтиллионов', 'три квинвигинтиллиона'], ['четыре квинвигинтиллионов', 'четыре квинвигинтиллиона'], ['один сексвигинтиллионов', 'один сексвигинтиллион'], ['два сексвигинтиллионов', 'два сексвигинтиллиона'], ['три сексвигинтиллионов', 'три сексвигинтиллиона'], ['четыре сексвигинтиллионов', 'четыре сексвигинтиллиона'], ['один септемвигинтиллионов', 'один септемвигинтиллион'], ['два септемвигинтиллионов', 'два септемвигинтиллиона'], ['три септемвигинтиллионов', 'три септемвигинтиллиона'], ['четыре септемвигинтиллионов', 'четыре септемвигинтиллиона'], ['один октовигинтиллионов', 'один октовигинтиллион'], ['два октовигинтиллионов', 'два октовигинтиллиона'], ['три октовигинтиллионов', 'три октовигинтиллиона'], ['четыре октовигинтиллионов', 'четыре октовигинтиллиона'], ['один новемвигинтиллионов', 'один новемвигинтиллион'], ['два новемвигинтиллионов', 'два новемвигинтиллиона'], ['три новемвигинтиллионов', 'три новемвигинтиллиона'], ['четыре новемвигинтиллионов', 'четыре новемвигинтиллиона'], ['один тригинтиллионов', 'один тригинтиллион'], ['два тригинтиллионов', 'два тригинтиллиона'], ['три тригинтиллионов', 'три тригинтиллиона'], ['четыре тригинтиллионов', 'четыре тригинтиллиона'], ['один антригинтиллионов', 'один антригинтиллион'], ['два антригинтиллионов', 'два антригинтиллиона'], ['три антригинтиллионов', 'три антригинтиллиона'], ['четыре антригинтиллионов', 'четыре антригинтиллиона'], ['один гуголов', 'один гугол'], ['два гуголов', 'два гугола'], ['три гуголов', 'три гугола'], ['четыре гуголов', 'четыре гугола']
    ].freeze
    SUB_ONE_GROUPING = ['ноль', 'один', 'два', 'три', 'четыре', 'пять', 'шесть', 'семь', 'восемь', 'девять', 'десять', 'одиннадцать', 'двенадцать', 'тринадцать', 'четырнадцать', 'пятнадцать', 'шестнадцать', 'семнадцать', 'восемнадцать', 'девятнадцать', 'двадцать', 'двадцать один', 'двадцать два', 'двадцать три', 'двадцать четыре', 'двадцать пять', 'двадцать шесть', 'двадцать семь', 'двадцать восемь', 'двадцать девять', 'тридцать', 'тридцать один', 'тридцать два', 'тридцать три', 'тридцать четыре', 'тридцать пять', 'тридцать шесть', 'тридцать семь', 'тридцать восемь', 'тридцать девять', 'сорок', 'сорок один', 'сорок два', 'сорок три', 'сорок четыре', 'сорок пять', 'сорок шесть', 'сорок семь', 'сорок восемь', 'сорок девять', 'пятьдесят', 'пятьдесят один', 'пятьдесят два', 'пятьдесят три', 'пятьдесят четыре', 'пятьдесят пять', 'пятьдесят шесть', 'пятьдесят семь', 'пятьдесят восемь', 'пятьдесят девять', 'шестьдесят', 'шестьдесят один', 'шестьдесят два', 'шестьдесят три', 'шестьдесят четыре', 'шестьдесят пять', 'шестьдесят шесть', 'шестьдесят семь', 'шестьдесят восемь', 'шестьдесят девять', 'семьдесят', 'семьдесят один', 'семьдесят два', 'семьдесят три', 'семьдесят четыре', 'семьдесят пять', 'семьдесят шесть', 'семьдесят семь', 'семьдесят восемь', 'семьдесят девять', 'восемьдесят', 'восемьдесят один', 'восемьдесят два', 'восемьдесят три', 'восемьдесят четыре', 'восемьдесят пять', 'восемьдесят шесть', 'восемьдесят семь', 'восемьдесят восемь', 'восемьдесят девять', 'девяносто', 'девяносто один', 'девяносто два', 'девяносто три', 'девяносто четыре', 'девяносто пять', 'девяносто шесть', 'девяносто семь', 'девяносто восемь', 'девяносто девять', 'сто', 'сто один', 'сто два', 'сто три', 'сто четыре', 'сто пять', 'сто шесть', 'сто семь', 'сто восемь', 'сто девять', 'сто десять', 'сто одиннадцать', 'сто двенадцать', 'сто тринадцать', 'сто четырнадцать', 'сто пятнадцать', 'сто шестнадцать', 'сто семнадцать', 'сто восемнадцать', 'сто девятнадцать', 'сто двадцать', 'сто двадцать один', 'сто двадцать два', 'сто двадцать три', 'сто двадцать четыре', 'сто двадцать пять', 'сто двадцать шесть', 'сто двадцать семь', 'сто двадцать восемь', 'сто двадцать девять', 'сто тридцать', 'сто тридцать один', 'сто тридцать два', 'сто тридцать три', 'сто тридцать четыре', 'сто тридцать пять', 'сто тридцать шесть', 'сто тридцать семь', 'сто тридцать восемь', 'сто тридцать девять', 'сто сорок', 'сто сорок один', 'сто сорок два', 'сто сорок три', 'сто сорок четыре', 'сто сорок пять', 'сто сорок шесть', 'сто сорок семь', 'сто сорок восемь', 'сто сорок девять', 'сто пятьдесят', 'сто пятьдесят один', 'сто пятьдесят два', 'сто пятьдесят три', 'сто пятьдесят четыре', 'сто пятьдесят пять', 'сто пятьдесят шесть', 'сто пятьдесят семь', 'сто пятьдесят восемь', 'сто пятьдесят девять', 'сто шестьдесят', 'сто шестьдесят один', 'сто шестьдесят два', 'сто шестьдесят три', 'сто шестьдесят четыре', 'сто шестьдесят пять', 'сто шестьдесят шесть', 'сто шестьдесят семь', 'сто шестьдесят восемь', 'сто шестьдесят девять', 'сто семьдесят', 'сто семьдесят один', 'сто семьдесят два', 'сто семьдесят три', 'сто семьдесят четыре', 'сто семьдесят пять', 'сто семьдесят шесть', 'сто семьдесят семь', 'сто семьдесят восемь', 'сто семьдесят девять', 'сто восемьдесят', 'сто восемьдесят один', 'сто восемьдесят два', 'сто восемьдесят три', 'сто восемьдесят четыре', 'сто восемьдесят пять', 'сто восемьдесят шесть', 'сто восемьдесят семь', 'сто восемьдесят восемь', 'сто восемьдесят девять', 'сто девяносто', 'сто девяносто один', 'сто девяносто два', 'сто девяносто три', 'сто девяносто четыре', 'сто девяносто пять', 'сто девяносто шесть', 'сто девяносто семь', 'сто девяносто восемь', 'сто девяносто девять', 'двести', 'двести один', 'двести два', 'двести три', 'двести четыре', 'двести пять', 'двести шесть', 'двести семь', 'двести восемь', 'двести девять', 'двести десять', 'двести одиннадцать', 'двести двенадцать', 'двести тринадцать', 'двести четырнадцать', 'двести пятнадцать', 'двести шестнадцать', 'двести семнадцать', 'двести восемнадцать', 'двести девятнадцать', 'двести двадцать', 'двести двадцать один', 'двести двадцать два', 'двести двадцать три', 'двести двадцать четыре', 'двести двадцать пять', 'двести двадцать шесть', 'двести двадцать семь', 'двести двадцать восемь', 'двести двадцать девять', 'двести тридцать', 'двести тридцать один', 'двести тридцать два', 'двести тридцать три', 'двести тридцать четыре', 'двести тридцать пять', 'двести тридцать шесть', 'двести тридцать семь', 'двести тридцать восемь', 'двести тридцать девять', 'двести сорок', 'двести сорок один', 'двести сорок два', 'двести сорок три', 'двести сорок четыре', 'двести сорок пять', 'двести сорок шесть', 'двести сорок семь', 'двести сорок восемь', 'двести сорок девять', 'двести пятьдесят', 'двести пятьдесят один', 'двести пятьдесят два', 'двести пятьдесят три', 'двести пятьдесят четыре', 'двести пятьдесят пять', 'двести пятьдесят шесть', 'двести пятьдесят семь', 'двести пятьдесят восемь', 'двести пятьдесят девять', 'двести шестьдесят', 'двести шестьдесят один', 'двести шестьдесят два', 'двести шестьдесят три', ' двести шестьдесят четыре', 'двести шестьдесят пять', 'двести шестьдесят шесть', 'двести шестьдесят семь', 'двести шестьдесят восемь', 'двести шестьдесят девять', 'двести семьдесят', 'двести семьдесят один', 'двести семьдесят два', 'двести семьдесят три', 'двести семьдесят четыре', 'двести семьдесят пять', 'двести семьдесят шесть', 'двести семьдесят семь', 'двести семьдесят восемь', 'двести семьдесят девять', 'двести восемьдесят', 'двести восемьдесят один', 'двести восемьдесят два', 'двести восемьдесят три', 'двести восемьдесят четыре', 'двести восемьдесят пять', 'двести восемьдесят шесть', 'двести восемьдесят семь', 'двести восемьдесят восемь', 'двести восемьдесят девять', 'двести девяносто', 'двести девяносто один', 'двести девяносто два', 'двести девяносто три', 'двести девяносто четыре', 'двести девяносто пять', 'двести девяносто шесть', 'двести девяносто семь', 'двести девяносто восемь', 'двести девяносто девять', 'триста', 'триста один', 'триста два', 'триста три', 'триста четыре', 'триста пять', 'триста шесть', 'триста семь', 'триста восемь', 'триста девять', 'триста десять', 'триста одиннадцать', 'триста двенадцать', 'триста тринадцать', 'триста четырнадцать', 'триста пятнадцать', 'триста шестнадцать', 'триста семнадцать', 'триста восемнадцать', 'триста девятнадцать', 'триста двадцать', 'триста двадцать один', 'триста двадцать два', 'триста двадцать три', 'триста двадцать четыре', 'триста двадцать пять', 'триста двадцать шесть', 'триста двадцать семь', 'триста двадцать восемь', 'триста двадцать девять', 'триста тридцать', 'триста тридцать один', 'триста тридцать два', 'триста тридцать три', 'триста тридцать четыре', 'триста тридцать пять', 'триста тридцать шесть', 'триста тридцать семь', 'триста тридцать восемь', 'триста тридцать девять', 'триста сорок', 'триста сорок один', 'триста сорок два', 'триста сорок три', 'триста сорок четыре', 'триста сорок пять', 'триста сорок шесть', 'триста сорок семь', 'триста сорок восемь', 'триста сорок девять', 'триста пятьдесят', 'триста пятьдесят один', 'триста пятьдесят два', 'триста пятьдесят три', 'триста пятьдесят четыре', 'триста пятьдесят пять', 'триста пятьдесят шесть', 'триста пятьдесят семь', 'триста пятьдесят восемь', 'триста пятьдесят девять', 'триста шестьдесят', 'триста шестьдесят один', 'триста шестьдесят два', 'триста шестьдесят три', 'триста шестьдесят четыре', 'триста шестьдесят пять', 'триста шестьдесят шесть', 'триста шестьдесят семь', 'триста шестьдесят восемь', 'триста шестьдесят девять', 'триста семьдесят', 'триста семьдесят один', 'триста семьдесят два', 'триста семьдесят три', 'триста семьдесят четыре', 'триста семьдесят пять', 'триста семьдесят шесть', 'триста семьдесят семь', 'триста семьдесят восемь', 'триста семьдесят девять', 'триста восемьдесят', 'триста восемьдесят один', 'триста восемьдесят два', 'триста восемьдесят три', 'триста восемьдесят четыре', 'триста восемьдесят пять', 'триста восемьдесят шесть', 'триста восемьдесят семь', 'триста восемьдесят восемь', 'триста восемьдесят девять', 'триста девяносто', 'триста девяносто один', 'триста девяносто два', 'триста девяносто три', 'триста девяносто четыре', 'триста девяносто пять', 'триста девяносто шесть', 'триста девяносто семь', 'триста девяносто восемь', 'триста девяносто девять', 'четыреста', 'четыреста один', 'четыреста два', 'четыреста три', 'четыреста четыре', 'четыреста пять', 'четыреста шесть', 'четыреста семь', 'четыреста восемь', 'четыреста девять', 'четыреста десять', 'четыреста одиннадцать', 'четыреста двенадцать', 'четыреста тринадцать', 'четыреста четырнадцать', 'четыреста пятнадцать', 'четыреста шестнадцать', 'четыреста семнадцать', 'четыреста восемнадцать', 'четыреста девятнадцать', 'четыреста двадцать', 'четыреста двадцать один', 'четыреста двадцать два', 'четыреста двадцать три', 'четыреста двадцать четыре', 'четыреста двадцать пять', 'четыреста двадцать шесть', 'четыреста двадцать семь', 'четыреста двадцать восемь', 'четыреста двадцать девять', 'четыреста тридцать', 'четыреста тридцать один', 'четыреста тридцать два', 'четыреста тридцать три', 'четыреста тридцать четыре', 'четыреста тридцать пять', 'четыреста тридцать шесть', 'четыреста тридцать семь', 'четыреста тридцать восемь', 'четыреста тридцать девять', 'четыреста сорок', 'четыреста сорок один', 'четыреста сорок два', 'четыреста сорок три', 'четыреста сорок четыре', 'четыреста сорок пять', 'четыреста сорок шесть', 'четыреста сорок семь', 'четыреста сорок восемь', 'четыреста сорок девять', 'четыреста пятьдесят', 'четыреста пятьдесят один', 'четыреста пятьдесят два', 'четыреста пятьдесят три', 'четыреста пятьдесят четыре', 'четыреста пятьдесят пять', 'четыреста пятьдесят шесть', 'четыреста пятьдесят семь', 'четыреста пятьдесят восемь', 'четыреста пятьдесят девять', 'четыреста шестьдесят', 'четыреста шестьдесят один', 'четыреста шестьдесят два', 'четыреста шестьдесят три', 'четыреста шестьдесят четыре', 'четыреста шестьдесят пять', 'четыреста шестьдесят шесть', 'четыреста шестьдесят семь', 'четыреста шестьдесят восемь', 'четыреста шестьдесят девять', 'четыреста семьдесят', 'четыреста семьдесят один', 'четыреста семьдесят два', 'четыреста семьдесят три', 'четыреста семьдесят четыре', 'четыреста семьдесят пять', 'четыреста семьдесят шесть', 'четыреста семьдесят семь', 'четыреста семьдесят восемь', 'четыреста семьдесят девять', 'четыреста восемьдесят', 'четыреста восемьдесят один', 'четыреста восемьдесят два', 'четыреста восемьдесят три', 'четыреста восемьдесят четыре', 'четыреста восемьдесят пять', 'четыреста восемьдесят шесть', 'четыреста восемьдесят семь', 'четыреста восемьдесят восемь', 'четыреста восемьдесят девять', 'четыреста девяносто', 'четыреста девяносто один', 'четыреста девяносто два', 'четыреста девяносто три', 'четыреста девяносто четыре', 'четыреста девяносто пять', 'четыреста девяносто шесть', 'четыреста девяносто семь', 'четыреста девяносто восемь', 'четыреста девяносто девять', 'пятьсот', 'пятьсот один', 'пятьсот два', 'пятьсот три', 'пятьсот четыре', 'пятьсот пять', 'пятьсот шесть', 'пятьсот семь', 'пятьсот восемь', 'пятьсот девять', 'пятьсот десять', 'пятьсот одиннадцать', 'пятьсот двенадцать', 'пятьсот тринадцать', 'пятьсот четырнадцать', 'пятьсот пятнадцать', 'пятьсот шестнадцать', 'пятьсот семнадцать', 'пятьсот восемнадцать', 'пятьсот девятнадцать', 'пятьсот двадцать', 'пятьсот двадцать один', 'пятьсот двадцать два', 'пятьсот двадцать три', 'пятьсот двадцать четыре', 'пятьсот двадцать пять', 'пятьсот двадцать шесть', 'пятьсот двадцать семь', 'пятьсот двадцать восемь', 'пятьсот двадцать девять', 'пятьсот тридцать', 'пятьсот тридцать один', 'пятьсот тридцать два', 'пятьсот тридцать три', 'пятьсот тридцать четыре', 'пятьсот тридцать пять', 'пятьсот тридцать шесть', 'пятьсот тридцать семь', 'пятьсот тридцать восемь', 'пятьсот тридцать девять', 'пятьсот сорок', 'пятьсот сорок один', 'пятьсот сорок два', 'пятьсот сорок три', 'пятьсот сорок четыре', 'пятьсот сорок пять', 'пятьсот сорок шесть', 'пятьсот сорок семь', 'пятьсот сорок восемь', 'пятьсот сорок девять', 'пятьсот пятьдесят', 'пятьсот пятьдесят один', 'пятьсот пятьдесят два', 'пятьсот пятьдесят три', 'пятьсот пятьдесят четыре', 'пятьсот пятьдесят пять', 'пятьсот пятьдесят шесть', 'пятьсот пятьдесят семь', 'пятьсот пятьдесят восемь', 'пятьсот пятьдесят девять', 'пятьсот шестьдесят', 'пятьсот шестьдесят один', 'пятьсот шестьдесят два', 'пятьсот шестьдесят три', 'пятьсот шестьдесят четыре', 'пятьсот шестьдесят пять', 'пятьсот шестьдесят шесть', 'пятьсот шестьдесят семь', 'пятьсот шестьдесят восемь', 'пятьсот шестьдесят девять', 'пятьсот семьдесят', 'пятьсот семьдесят один', 'пятьсот семьдесят два', 'пятьсот семьдесят три', 'пятьсот семьдесят четыре', 'пятьсот семьдесят пять', 'пятьсот семьдесят шесть', 'пятьсот семьдесят семь', 'пятьсот семьдесят восемь', 'пятьсот семьдесят девять', 'пятьсот восемьдесят', 'пятьсот восемьдесят один', 'пятьсот восемьдесят два', 'пятьсот восемьдесят три', 'пятьсот восемьдесят четыре', 'пятьсот восемьдесят пять', 'пятьсот восемьдесят шесть', 'пятьсот восемьдесят семь', 'пятьсот восемьдесят восемь', 'пятьсот восемьдесят девять', 'пятьсот девяносто', 'пятьсот девяносто один', 'пятьсот девяносто два', 'пятьсот девяносто три', 'пятьсот девяносто четыре', 'пятьсот девяносто пять', 'пятьсот девяносто шесть', 'пятьсот девяносто семь', 'пятьсот девяносто восемь', 'пятьсот девяносто девять', 'шестьсот', 'шестьсот один', 'шестьсот два', 'шестьсот три', 'шестьсот четыре', 'шестьсот пять', 'шестьсот шесть', 'шестьсот семь', 'шестьсот восемь', 'шестьсот девять', 'шестьсот десять', 'шестьсот одиннадцать', 'шестьсот двенадцать', 'шестьсот тринадцать', 'шестьсот четырнадцать', 'шестьсот пятнадцать', 'шестьсот шестнадцать', 'шестьсот семнадцать', 'шестьсот восемнадцать', 'шестьсот девятнадцать', 'шестьсот двадцать', 'шестьсот двадцать один', 'шестьсот двадцать два', 'шестьсот двадцать три', 'шестьсот двадцать четыре', 'шестьсот двадцать пять', 'шестьсот двадцать шесть', 'шестьсот двадцать семь', 'шестьсот двадцать восемь', 'шестьсот двадцать девять', 'шестьсот тридцать', 'шестьсот тридцать один', 'шестьсот тридцать два', 'шестьсот тридцать три', 'шестьсот тридцать четыре', 'шестьсот тридцать пять', 'шестьсот тридцать шесть', 'шестьсот тридцать семь', 'шестьсот тридцать восемь', 'шестьсот тридцать девять', 'шестьсот сорок', 'шестьсот сорок один', 'шестьсот сорок два', 'шестьсот сорок три', 'шестьсот сорок четыре', 'шестьсот сорок пять', 'шестьсот сорок шесть', 'шестьсот сорок семь', 'шестьсот сорок восемь', 'шестьсот сорок девять', 'шестьсот пятьдесят', 'шестьсот пятьдесят один', 'шестьсот пятьдесят два', 'шестьсот пятьдесят три', 'шестьсот пятьдесят четыре', 'шестьсот пятьдесят пять', 'шестьсот пятьдесят шесть', 'шестьсот пятьдесят семь', 'шестьсот пятьдесят восемь', 'шестьсот пятьдесят девять', 'шестьсот шестьдесят', 'шестьсот шестьдесят один', 'шестьсот шестьдесят два', 'шестьсот шестьдесят три', 'шестьсот шестьдесят четыре', 'шестьсот шестьдесят пять', 'шестьсот шестьдесят шесть', 'шестьсот шестьдесят семь', 'шестьсот шестьдесят восемь', 'шестьсот шестьдесят девять', 'шестьсот семьдесят', 'шестьсот семьдесят один', 'шестьсот семьдесят два', 'шестьсот семьдесят три', 'шестьсот семьдесят четыре', 'шестьсот семьдесят пять', 'шестьсот семьдесят шесть', 'шестьсот семьдесят семь', 'шестьсот семьдесят восемь', 'шестьсот семьдесят девять', 'шестьсот восемьдесят', 'шестьсот восемьдесят один', 'шестьсот восемьдесят два', 'шестьсот восемьдесят три', 'шестьсот восемьдесят четыре', 'шестьсот восемьдесят пять', 'шестьсот восемьдесят шесть', 'шестьсот восемьдесят семь', 'шестьсот восемьдесят восемь', 'шестьсот восемьдесят девять', 'шестьсот девяносто', 'шестьсот девяносто один', 'шестьсот девяносто два', 'шестьсот девяносто три', 'шестьсот девяносто четыре', 'шестьсот девяносто пять', 'шестьсот девяносто шесть', 'шестьсот девяносто семь', 'шестьсот девяносто восемь', 'шестьсот девяносто девять', 'семьсот', 'семьсот один', 'семьсот два', 'семьсот три', 'семьсот четыре', 'семьсот пять', 'семьсот шесть', 'семьсот семь', 'семьсот восемь', 'семьсот девять', 'семьсот десять', 'семьсот одиннадцать', 'семьсот двенадцать', 'семьсот тринадцать', 'семьсот четырнадцать', 'семьсот пятнадцать', 'семьсот шестнадцать', 'семьсот семнадцать', 'семьсот восемнадцать', 'семьсот девятнадцать', 'семьсот двадцать', 'семьсот двадцать один', 'семьсот двадцать два', 'семьсот двадцать три', 'семьсот двадцать четыре', 'семьсот двадцать пять', 'семьсот двадцать шесть', 'семьсот двадцать семь', 'семьсот двадцать восемь', 'семьсот двадцать девять', 'семьсот тридцать', 'семьсот тридцать один', 'семьсот тридцать два', 'семьсот тридцать три', 'семьсот тридцать четыре', 'семьсот тридцать пять', 'семьсот тридцать шесть', 'семьсот тридцать семь', 'семьсот тридцать восемь', 'семьсот тридцать девять', 'семьсот сорок', 'семьсот сорок один', 'семьсот сорок два', 'семьсот сорок три', 'семьсот сорок четыре', 'семьсот сорок пять', 'семьсот сорок шесть', 'семьсот сорок семь', 'семьсот сорок восемь', 'семьсот сорок девять', 'семьсот пятьдесят', 'семьсот пятьдесят один', 'семьсот пятьдесят два', 'семьсот пятьдесят три', 'семьсот пятьдесят четыре', 'семьсот пятьдесят пять', 'семьсот пятьдесят шесть', 'семьсот пятьдесят семь', 'семьсот пятьдесят восемь', 'семьсот пятьдесят девять', 'семьсот шестьдесят', 'семьсот шестьдесят один', 'семьсот шестьдесят два', 'семьсот шестьдесят три', 'семьсот шестьдесят четыре', 'семьсот шестьдесят пять', 'семьсот шестьдесят шесть', 'семьсот шестьдесят семь', 'семьсот шестьдесят восемь', 'семьсот шестьдесят девять', 'семьсот семьдесят', 'семьсот семьдесят один', 'семьсот семьдесят два', 'семьсот семьдесят три', 'семьсот семьдесят четыре', 'семьсот семьдесят пять', 'семьсот семьдесят шесть', 'семьсот семьдесят семь', 'семьсот семьдесят восемь', 'семьсот семьдесят девять', 'семьсот восемьдесят', 'семьсот восемьдесят один', 'семьсот восемьдесят два', 'семьсот восемьдесят три', 'семьсот восемьдесят четыре', 'семьсот восемьдесят пять', 'семьсот восемьдесят шесть', 'семьсот восемьдесят семь', 'семьсот восемьдесят восемь', 'семьсот восемьдесят девять', 'семьсот девяносто', 'семьсот девяносто один', 'семьсот девяносто два', 'семьсот девяносто три', 'семьсот девяносто четыре', 'семьсот девяносто пять', 'семьсот девяносто шесть', 'семьсот девяносто семь', 'семьсот девяносто восемь', 'семьсот девяносто девять', 'восемьсот', 'восемьсот один', 'восемьсот два', 'восемьсот три', 'восемьсот четыре', 'восемьсот пять', 'восемьсот шесть', 'восемьсот семь', 'восемьсот восемь', 'восемьсот девять', 'восемьсот десять', '
      восемьсот одиннадцать', 'восемьсот двенадцать', 'восемьсот тринадцать', 'восемьсот четырнадцать', 'восемьсот пятнадцать', 'восемьсот шестнадцать', 'восемьсот семнадцать', 'восемьсот восемнадцать', 'восемьсот девятнадцать', 'восемьсот двадцать', 'восемьсот двадцать один', 'восемьсот двадцать два', 'восемьсот двадцать три', 'восемьсот двадцать четыре', 'восемьсот двадцать пять', 'восемьсот двадцать шесть', 'восемьсот двадцать семь', 'восемьсот двадцать восемь', 'восемьсот двадцать девять', 'восемьсот тридцать', 'восемьсот тридцать один', 'восемьсот тридцать два', 'восемьсот тридцать три', 'восемьсот тридцать четыре', 'восемьсот тридцать пять', 'восемьсот тридцать шесть', 'восемьсот тридцать семь', 'восемьсот тридцать восемь', 'восемьсот тридцать девять', 'восемьсот сорок', 'восемьсот сорок один', 'восемьсот сорок два', 'восемьсот сорок три', 'восемьсот сорок четыре', 'восемьсот сорок пять', 'восемьсот сорок шесть', 'восемьсот сорок семь', 'восемьсот сорок восемь', 'восемьсот сорок девять', 'восемьсот пятьдесят', 'восемьсот пятьдесят один', 'восемьсот пятьдесят два', 'восемьсот пятьдесят три', 'восемьсот пятьдесят четыре', 'восемьсот пятьдесят пять', 'восемьсот пятьдесят шесть', 'восемьсот пятьдесят семь', 'восемьсот пятьдесят восемь', 'восемьсот пятьдесят девять', 'восемьсот шестьдесят', 'восемьсот шестьдесят один', 'восемьсот шестьдесят два', 'восемьсот шестьдесят три', 'восемьсот шестьдесят четыре', 'восемьсот шестьдесят пять', 'восемьсот шестьдесят шесть', 'восемьсот шестьдесят семь', 'восемьсот шестьдесят восемь', 'восемьсот шестьдесят девять', 'восемьсот семьдесят', 'восемьсот семьдесят один', 'восемьсот семьдесят два', 'восемьсот семьдесят три', 'восемьсот семьдесят четыре', 'восемьсот семьдесят пять', 'восемьсот семьдесят шесть', 'восемьсот семьдесят семь', 'восемьсот семьдесят восемь', 'восемьсот семьдесят девять', 'восемьсот восемьдесят', 'восемьсот восемьдесят один', 'восемьсот восемьдесят два', 'восемьсот восемьдесят три', 'восемьсот восемьдесят четыре', 'восемьсот восемьдесят пять', 'восемьсот восемьдесят шесть', 'восемьсот восемьдесят семь', 'восемьсот восемьдесят восемь', 'восемьсот восемьдесят девять', 'восемьсот девяносто', 'восемьсот девяносто один', 'восемьсот девяносто два', 'восемьсот девяносто три', 'восемьсот девяносто четыре', 'восемьсот девяносто пять', 'восемьсот девяносто шесть', 'восемьсот девяносто семь', 'восемьсот девяносто восемь', 'восемьсот девяносто девять', 'девятьсот', 'девятьсот один', 'девятьсот два', 'девятьсот три', 'девятьсот четыре', 'девятьсот пять', 'девятьсот шесть', 'девятьсот семь', 'девятьсот восемь', 'девятьсот девять', 'девятьсот десять', 'девятьсот одиннадцать', 'девятьсот двенадцать', 'девятьсот тринадцать', 'девятьсот четырнадцать', 'девятьсот пятнадцать', 'девятьсот шестнадцать', 'девятьсот семнадцать', 'девятьсот восемнадцать', 'девятьсот девятнадцать', 'девятьсот двадцать', 'девятьсот двадцать один', 'девятьсот двадцать два', 'девятьсот двадцать три', 'девятьсот двадцать четыре', 'девятьсот двадцать пять', 'девятьсот двадцать шесть', 'девятьсот двадцать семь', 'девятьсот двадцать восемь', 'девятьсот двадцать девять', 'девятьсот тридцать', 'девятьсот тридцать один', 'девятьсот тридцать два', 'девятьсот тридцать три', 'девятьсот тридцать четыре', 'девятьсот тридцать пять', 'девятьсот тридцать шесть', 'девятьсот тридцать семь', 'девятьсот тридцать восемь', 'девятьсот тридцать девять', 'девятьсот сорок', 'девятьсот сорок один', 'девятьсот сорок два', 'девятьсот сорок три', 'девятьсот сорок четыре', 'девятьсот сорок пять', 'девятьсот сорок шесть', 'девятьсот сорок семь', 'девятьсот сорок восемь', 'девятьсот сорок девять', 'девятьсот пятьдесят', 'девятьсот пятьдесят один', 'девятьсот пятьдесят два', 'девятьсот пятьдесят три', 'девятьсот пятьдесят четыре', 'девятьсот пятьдесят пять', 'девятьсот пятьдесят шесть', 'девятьсот пятьдесят семь', 'девятьсот пятьдесят восемь', 'девятьсот пятьдесят девять', 'девятьсот шестьдесят', 'девятьсот шестьдесят один', 'девятьсот шестьдесят два', 'девятьсот шестьдесят три', 'девятьсот шестьдесят четыре', 'девятьсот шестьдесят пять', 'девятьсот шестьдесят шесть', 'девятьсот шестьдесят семь', 'девятьсот шестьдесят восемь', 'девятьсот шестьдесят девять', 'девятьсот семьдесят', 'девятьсот семьдесят один', 'девятьсот семьдесят два', 'девятьсот семьдесят три', 'девятьсот семьдесят четыре', 'девятьсот семьдесят пять', 'девятьсот семьдесят шесть', 'девятьсот семьдесят семь', 'девятьсот семьдесят восемь', 'девятьсот семьдесят девять', 'девятьсот восемьдесят', 'девятьсот восемьдесят один', 'девятьсот восемьдесят два', 'девятьсот восемьдесят три', 'девятьсот восемьдесят четыре', 'девятьсот восемьдесят пять', 'девятьсот восемьдесят шесть', 'девятьсот восемьдесят семь', 'девятьсот восемьдесят восемь', 'девятьсот восемьдесят девять', 'девятьсот девяносто', 'девятьсот девяносто один', 'девятьсот девяносто два', 'девятьсот девяносто три', 'девятьсот девяносто четыре', 'девятьсот девяносто пять', 'девятьсот девяносто шесть', 'девятьсот девяносто семь', 'девятьсот девяносто восемь', 'девятьсот девяносто девять'].freeze
  end
end
