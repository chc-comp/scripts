(declare-fun pred ((Int)) Bool)

(set-logic HORN)

(assert
  (forall ((n Int))
    (=> (> n 0) (pred n))
  )
)

(assert
  (forall ((n Int))
    (=>
      (and (pred (- n 1)) (> n 0) (= (mod n 2) 0))
      (pred n)
    )
  )
)

(assert
  (forall ((n Int))
    (=> (pred n) (> n 0))
  )
)

(check-sat)