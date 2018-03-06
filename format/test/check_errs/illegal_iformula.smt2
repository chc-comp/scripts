(declare-fun pred (Int Int) Bool)
(declare-fun var () Int)

(set-logic HORN)

(assert
  (forall ((n Int))
    (=> (>= var 0) (pred var n))
  )
)

(check-sat)