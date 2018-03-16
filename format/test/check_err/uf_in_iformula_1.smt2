(declare-fun pred (Int Int) Bool)
(declare-fun var () Int)

(set-logic HORN)

(assert
  (forall ((n Int))
    (=> (and (>= var 0)) (pred var n))
  )
)

(assert
  (forall ((n Int))
    (=> (and (< n 0) (pred var n)) false)
  )
)

(check-sat)