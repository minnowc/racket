;;; The Computer Language Benchmarks Game
;;; http://shootout.alioth.debian.org/
;;;
;;; spellcheck benchmark

(: dict (HashTable Bytes Boolean))
(define dict (make-hash))

(with-input-from-file "Usr.Dict.Words"
  (lambda ()
    (let: loop : Void ()
      (let ([r (read-bytes-line)])
        (unless (eof-object? r)
          (hash-set! dict r #t)
          (loop))))))

(let ([in (current-input-port)])
  (let: loop : Void ()
    (let ([w (read-bytes-line in)])
      (unless (eof-object? w)
        (unless (hash-ref dict w (lambda () #f))
          (printf "~a\n" w))
        (loop)))))
