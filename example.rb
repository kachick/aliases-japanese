#!/usr/local/bin/ruby -w
# coding: utf-8

require_relative 'lib/aliases/japanese'

ずっと do
  行出力(
    if (てきとーな整数 = 乱数.かける(10).繰り上げ).奇数?
      "#{てきとーな整数}は奇数です"
    else
      "#{てきとーな整数}・・・の次の数(#{てきとーな整数.次})は奇数です" # なぜこだわる
    end
  )

  一時停止 0.5
end
