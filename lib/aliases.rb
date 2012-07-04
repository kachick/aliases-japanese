# coding: utf-8
# Copyright (c) 2012 Kenichi Kamiya

module Aliases

  module Japanese
  
    BasicObject = {
      :'!' => :反転,
      :'!=' => :'違う?',
      :'==' => [:同値?, :等しい?],
      #__id__:  保留,
      __send__: :やらせる,
      equal?: :同一?,
      instance_eval: :レシーバのコンテキストで評価, # カタカナ多いなー
      instance_exec: :レシーバのコンテキストでブロックを評価,
      method_missing: [:無かった時, :受け皿],
      singleton_method_added: :特異メソッドが追加された時,
      singleton_method_removed: :特異メソッドが削除された時,
      singleton_method_undefined: :特異メソッドが未定義にされた時,
    }
    
    Kernel = {
      Array: :配列,
      Complex: :複素数,
      Float: :小数,
      Integer: :整数,
      Rational: [:有理数, :分数],
      String: :文字列,
      abort: :失敗,
      at_exit: :終了時に実行,
      #autoload: 保留
      #autoload?: 保留
      #binding: 保留
      block_given?: :ブロック付き?,
      caller: :呼び出し元,
      catch: :掴む,
      eval: :評価,
      exec: [:実行, :シェルで走らせる],
      exit: :終了,
      exit!: :強制終了,
      raise: :例外,
      fork: [:分岐, :プロセス複製], 
      gets: :行入力,
      global_variables: [:グローバル変数名達, :大域変数名達],
      lambda: :塊,
      #load: 保留
      local_variables: [:ローカル変数名達, :局所変数名達],
      loop: :ずっと,
      open: [:開く, :開ける],
      p: [:見てみる, :要するに],
      print: :出力,
      printf: :整形して出力,
      format: :整形,
      putc: :文字出力,
      puts: :行出力,
      rand: :乱数,
      readline: :一行入力,
      readlines: :全行入力,
      require: :頂戴,
      require_relative: :それ頂戴,
      #select: :保留,
      set_trace_func: :都度,
      sleep: :一時停止,
      spawn: :シェルに投げておく,
      srand: :乱数の種を差し替える,
      syscall: :システムコール,
      # system: 保留
      test: :ファイル検査,
      throw: :投げる,
      trace_var: :グローバル変数へ代入されたら,
      trap: :シグナル割り込み時にシェルで走らせる,
      untrace_var: :グローバル変数へ代入された時にやろうと思ってたけどやっぱやめた,
      warn: :警告,
    }
    
    Object = {
      :'=~' => :正規表現に適合する?,
      class: :クラス,
      dup: :複製,
      clone: :おまけも複製,
      display: :表示,
      to_enum: :いにゅむ,
      eql?: :ハッシュ的に等しい？,
      extend: :拡張,
      freeze: :凍結,
      frozen?: :凍結済?,
      hash: :ハッシュ値,
      inspect: :読める文字列,
      instance_of?: :インスタンス?,
      instance_variable_defined?: :インスタンス変数定義済?,
      instance_variable_get: :インスタンス変数の参照先を得る,
      instance_variable_set: :インスタンス変数に代入する,
      instance_variables: :インスタンス変数名達,
      kind_of?: :類?,
      #marshal_dump: 保留,
      #marshal_load: 保留,
      method: :メソッドオブジェクト,
      methods: :メソッド名達,
      #nil? 保留,
      private_methods: :内部メソッド名達,
      #protected_methods: 保留,
      public_methods: :公開メソッド名達,
      #public_send: 保留,
      respond_to?: :応える?,
      respond_to_missing?: :受け皿に引っかかる?,
      singleton_class: :特異クラス,
      singleton_methods: :特異メソッド名達,
      taint: :汚す,
      tainted?: :汚い?,
      untaint: :綺麗にする,
      untrust: :信じない,
      untrusted?: :信じられない?,
      trust: :信じる,
      tap: :覗く,
      to_s: :文字列表現,
      initialize: :初期化時,
      initialize_copy: :複製初期化時,
      remove_instance_variable: :インスタンス変数の削除,
    }
  
  end

end

Aliases::Japanese.constants.each do |namespace|
  Object.const_get(namespace).module_eval do
  
    Aliases::Japanese.const_get(namespace).each_pair do |original, aliased|
      if aliased.respond_to?(:each)
        aliased.each do |name|
          alias_method name, original
        end
      else
        alias_method aliased, original
      end
    end
    
  end
end