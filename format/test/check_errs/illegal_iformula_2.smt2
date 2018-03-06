(declare-fun pred (Int Int) Bool)
(declare-fun not_pred (Int) Int)

(set-logic HORN)

(assert
  (forall ((n Int) (m Int))
    (=> (= (not_pred n) m) (pred m n))
  )
)

(check-sat)