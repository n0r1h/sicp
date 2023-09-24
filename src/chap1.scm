#!/usr/local/bin/gosh
;; -*- coding: utf-8 -*-
(print "Hello World")
(print "こんにちは、世界")

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))
(print (f 5))

