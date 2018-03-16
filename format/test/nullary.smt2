(declare-fun pred () Bool)

(set-logic HORN)

(assert
  (=> (and true) pred)
)

(assert
  (=> (and pred) false)
)

(check-sat)