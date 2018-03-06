(set-logic HORN)

(declare-fun unknown
  ( Int Int ) Bool
)

(assert
  (forall ( (|$V-reftype:10| Int) (|$alpha-1:x| Int) (|$knormal:1| Int) (|$knormal:2| Int) (|$knormal:3| Int) (|$knormal:5| Int) )
    (=>
      ( and (= |$knormal:2| (+ |$alpha-1:x| 11)) (= (not (= 0 |$knormal:1|)) (> |$alpha-1:x| 100)) (= |$V-reftype:10| |$knormal:5|) (not (not (= 0 |$knormal:1|))) (unknown |$knormal:5| |$knormal:3|) (unknown |$knormal:3| |$knormal:2|) true )
      (unknown |$V-reftype:10| |$alpha-1:x|)
    )
  )
)
(assert
  (forall ( (|$alpha-1:x| Int) (|$knormal:1| Int) (|$knormal:2| Int) (|$knormal:3| Int) )
    (=>
      ( and (= |$knormal:2| (+ |$alpha-1:x| 11)) (= (not (= 0 |$knormal:1|)) (> |$alpha-1:x| 100)) (not (not (= 0 |$knormal:1|))) (unknown |$knormal:3| |$knormal:2|) true )
      false
    )
  )
)
(assert
  (forall ( (|$V-reftype:8| Int) (|$alpha-1:x| Int) (|$knormal:1| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:1|)) (> |$alpha-1:x| 100)) (= |$V-reftype:8| (- |$alpha-1:x| 10)) (not (= 0 |$knormal:1|)) true )
      (unknown |$V-reftype:8| |$knormal:1|)
    )
  )
)
(check-sat)


