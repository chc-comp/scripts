(set-info :origin "Verification conditions for the caml program
  
  let rec bot _ = bot ()
  let fail _ = assert false
  
  let rec zip_1030 zip_without_checking_1077 x_DO_NOT_CARE_1079 x_DO_NOT_CARE_1080 x_DO_NOT_CARE_1081 xs_1031 prev_set_flag_zip_1062 s_prev_zip_xs_1060 s_prev_zip_ys_1061 ys_1032 =
    let u =if prev_set_flag_zip_1062 then
             if ((0 * 1) + (1 * s_prev_zip_xs_1060)) +
                (0 * s_prev_zip_ys_1061) >
                ((0 * 1) + (1 * xs_1031)) + (0 * ys_1032) &&
                ((0 * 1) + (1 * xs_1031)) + (0 * ys_1032) >= 0 then
               ()
             else
               let u_3427 = fail ()
               in
                 bot()
           else () in
           zip_without_checking_1077 x_DO_NOT_CARE_1079 x_DO_NOT_CARE_1080
             x_DO_NOT_CARE_1081 xs_1031 prev_set_flag_zip_1062
             s_prev_zip_xs_1060 s_prev_zip_ys_1061 ys_1032
  let rec zip_without_checking_1077 x_DO_NOT_CARE_1083 x_DO_NOT_CARE_1084 x_DO_NOT_CARE_1085 xs_1031 set_flag_zip_1063 s_zip_xs_1058 s_zip_ys_1059 ys_1032 =
    let set_flag_zip_1063 = true
    in
    let s_zip_ys_1059 = ys_1032
    in
    let s_zip_xs_1058 = xs_1031
    in
      if xs_1031 <= 0 then
        0
      else
        let xs'_1033 = xs_1031 - 1
        in
          if ys_1032 <= 0 then
            0
          else
            let ys'_1034 = ys_1032 - 1
            in
              1 +
              zip_1030 zip_without_checking_1077 set_flag_zip_1063 s_zip_xs_1058 s_zip_ys_1059 xs'_1033
                set_flag_zip_1063 s_zip_xs_1058 s_zip_ys_1059 ys'_1034
  
  let main l1_1037 l2_1038 =
    let set_flag_zip_1063 = false in
    let s_zip_xs_1058 = 0 in
    let s_zip_ys_1059 = 0 in
      zip_without_checking_1077 set_flag_zip_1063 s_zip_xs_1058 s_zip_ys_1059
        l1_1037 set_flag_zip_1063 s_zip_xs_1058 s_zip_ys_1059 l2_1038
")

(set-logic HORN)

(declare-fun |zip_without_checking_1077$unknown:31|
  ( Int Int Int Int Int Int Int Int Int ) Bool
)

(declare-fun |zip_without_checking_1077$unknown:30|
  ( Int Int Int Int Int Int Int Int ) Bool
)

(declare-fun |fail$unknown:3|
  ( Int ) Bool
)

(declare-fun |zip_1030$unknown:12|
  ( Int Int Int Int Int Int Int Int ) Bool
)

(declare-fun |zip_1030$unknown:22|
  ( Int Int Int Int Int Int Int Int Int ) Bool
)

(declare-fun |zip_1030$unknown:21|
  ( Int Int Int Int Int Int Int Int ) Bool
)

(declare-fun |zip_1030$unknown:13|
  ( Int Int Int Int Int Int Int Int Int ) Bool
)

(declare-fun |fail$unknown:4|
  ( Int Int ) Bool
)

(declare-fun |bot$unknown:2|
  ( Int Int ) Bool
)

(assert
  (forall ( (|$V-reftype:65| Int) (|$alpha-1:$$tmp::1| Int) (|$knormal:1| Int) (|$knormal:2| Int) )
    (=>
      ( and (= |$knormal:1| 1) (= |$V-reftype:65| |$knormal:2|) (|bot$unknown:2| |$knormal:2| |$knormal:1|) true )
      (|bot$unknown:2| |$V-reftype:65| |$alpha-1:$$tmp::1|)
    )
  )
)
(assert
  (forall ( (|$knormal:1| Int) )
    (=>
      ( and (= |$knormal:1| 1) true )
      true
    )
  )
)
(assert
  (forall ( (|$V-reftype:89| Int) (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:17| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) (|$knormal:36| Int) (|$knormal:37| Int) (|$knormal:38| Int) (|$knormal:39| Int) )
    (=>
      ( and (= |$knormal:38| 1) (= |$knormal:36| 1) (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (= |$V-reftype:89| |$knormal:17|) (not (not (= 0 |$knormal:35|))) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true (|zip_1030$unknown:13| |$knormal:17| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) (|fail$unknown:4| |$knormal:39| |$knormal:38|) (|bot$unknown:2| |$knormal:37| |$knormal:36|) )
      (|zip_1030$unknown:22| |$V-reftype:89| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|)
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) (|$knormal:36| Int) (|$knormal:37| Int) (|$knormal:38| Int) (|$knormal:39| Int) )
    (=>
      ( and (= |$knormal:38| 1) (= |$knormal:36| 1) (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (not (not (= 0 |$knormal:35|))) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true (|fail$unknown:4| |$knormal:39| |$knormal:38|) (|bot$unknown:2| |$knormal:37| |$knormal:36|) )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) (|$knormal:36| Int) (|$knormal:37| Int) (|$knormal:38| Int) (|$knormal:39| Int) )
    (=>
      ( and (= |$knormal:38| 1) (= |$knormal:36| 1) (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (not (not (= 0 |$knormal:35|))) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true (|fail$unknown:4| |$knormal:39| |$knormal:38|) (|bot$unknown:2| |$knormal:37| |$knormal:36|) )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) (|$knormal:36| Int) (|$knormal:37| Int) (|$knormal:38| Int) (|$knormal:39| Int) )
    (=>
      ( and (= |$knormal:38| 1) (= |$knormal:36| 1) (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (not (not (= 0 |$knormal:35|))) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true (|fail$unknown:4| |$knormal:39| |$knormal:38|) (|bot$unknown:2| |$knormal:37| |$knormal:36|) )
      (|zip_1030$unknown:12| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|)
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) (|$knormal:36| Int) (|$knormal:37| Int) (|$knormal:38| Int) (|$knormal:39| Int) )
    (=>
      ( and (= |$knormal:38| 1) (= |$knormal:36| 1) (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (not (not (= 0 |$knormal:35|))) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true (|fail$unknown:4| |$knormal:39| |$knormal:38|) (|bot$unknown:2| |$knormal:37| |$knormal:36|) )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) (|$knormal:36| Int) (|$knormal:37| Int) (|$knormal:38| Int) (|$knormal:39| Int) )
    (=>
      ( and (= |$knormal:38| 1) (= |$knormal:36| 1) (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (not (not (= 0 |$knormal:35|))) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true (|fail$unknown:4| |$knormal:39| |$knormal:38|) (|bot$unknown:2| |$knormal:37| |$knormal:36|) )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) (|$knormal:36| Int) (|$knormal:37| Int) (|$knormal:38| Int) (|$knormal:39| Int) )
    (=>
      ( and (= |$knormal:38| 1) (= |$knormal:36| 1) (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (not (not (= 0 |$knormal:35|))) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true (|fail$unknown:4| |$knormal:39| |$knormal:38|) (|bot$unknown:2| |$knormal:37| |$knormal:36|) )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) (|$knormal:36| Int) (|$knormal:37| Int) (|$knormal:38| Int) (|$knormal:39| Int) )
    (=>
      ( and (= |$knormal:38| 1) (= |$knormal:36| 1) (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (not (not (= 0 |$knormal:35|))) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true (|fail$unknown:4| |$knormal:39| |$knormal:38|) (|bot$unknown:2| |$knormal:37| |$knormal:36|) )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) (|$knormal:36| Int) (|$knormal:37| Int) (|$knormal:38| Int) (|$knormal:39| Int) )
    (=>
      ( and (= |$knormal:38| 1) (= |$knormal:36| 1) (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (not (not (= 0 |$knormal:35|))) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true (|fail$unknown:4| |$knormal:39| |$knormal:38|) (|bot$unknown:2| |$knormal:37| |$knormal:36|) )
      true
    )
  )
)
(assert
  (not (exists ( (|$alpha-2:$$tmp::2| Int) )
    ( and (|fail$unknown:3| |$alpha-2:$$tmp::2|) )
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) (|$knormal:36| Int) (|$knormal:38| Int) (|$knormal:39| Int) )
    (=>
      ( and (= |$knormal:38| 1) (= |$knormal:36| 1) (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (not (not (= 0 |$knormal:35|))) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true (|fail$unknown:4| |$knormal:39| |$knormal:38|) )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$V-reftype:26| Int) (|$V-reftype:50| Int) (|$V-reftype:52| Int) (|$V-reftype:54| Int) (|$V-reftype:56| Int) (|$V-reftype:58| Int) (|$V-reftype:60| Int) (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) (|zip_without_checking_1077| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true true true true true true (|zip_1030$unknown:12| |$V-reftype:26| |$V-reftype:60| |$V-reftype:58| |$V-reftype:56| |$V-reftype:54| |$V-reftype:52| |$V-reftype:50| |zip_without_checking_1077|) true true )
      (|zip_without_checking_1077$unknown:30| |$V-reftype:26| |$V-reftype:60| |$V-reftype:58| |$V-reftype:56| |$V-reftype:54| |$V-reftype:52| |$V-reftype:50| |zip_without_checking_1077|)
    )
  )
)
(assert
  (forall ( (|$V-reftype:50| Int) (|$V-reftype:52| Int) (|$V-reftype:54| Int) (|$V-reftype:56| Int) (|$V-reftype:58| Int) (|$V-reftype:60| Int) (|$V-reftype:62| Int) (|$V-reftype:63| Int) (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) (|zip_without_checking_1077| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:31| |$V-reftype:63| |$V-reftype:62| |$V-reftype:60| |$V-reftype:58| |$V-reftype:56| |$V-reftype:54| |$V-reftype:52| |$V-reftype:50| |zip_without_checking_1077|) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true true true true true true (|zip_1030$unknown:12| |$V-reftype:62| |$V-reftype:60| |$V-reftype:58| |$V-reftype:56| |$V-reftype:54| |$V-reftype:52| |$V-reftype:50| |zip_without_checking_1077|) true true )
      (|zip_1030$unknown:13| |$V-reftype:63| |$V-reftype:62| |$V-reftype:60| |$V-reftype:58| |$V-reftype:56| |$V-reftype:54| |$V-reftype:52| |$V-reftype:50| |zip_without_checking_1077|)
    )
  )
)
(assert
  (forall ( (|$V-reftype:86| Int) (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:17| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (= |$alpha-13:u| 1) (= |$V-reftype:86| |$knormal:17|) (not (= 0 |$knormal:35|)) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true (|zip_1030$unknown:13| |$knormal:17| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) )
      (|zip_1030$unknown:22| |$V-reftype:86| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|)
    )
  )
)
(assert
  (forall ( (|$V-reftype:91| Int) (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:17| Int) )
    (=>
      ( and (= |$alpha-13:u| 1) (= |$V-reftype:91| |$knormal:17|) (not (not (= 0 |$alpha-8:prev_set_flag_zip_1062|))) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true (|zip_1030$unknown:13| |$knormal:17| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) )
      (|zip_1030$unknown:22| |$V-reftype:91| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|)
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (= |$alpha-13:u| 1) (not (= 0 |$knormal:35|)) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (= |$alpha-13:u| 1) (not (= 0 |$knormal:35|)) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (= |$alpha-13:u| 1) (not (= 0 |$knormal:35|)) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true )
      (|zip_1030$unknown:12| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|)
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (= |$alpha-13:u| 1) (not (= 0 |$knormal:35|)) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (= |$alpha-13:u| 1) (not (= 0 |$knormal:35|)) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (= |$alpha-13:u| 1) (not (= 0 |$knormal:35|)) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (= |$alpha-13:u| 1) (not (= 0 |$knormal:35|)) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (= |$alpha-13:u| 1) (not (= 0 |$knormal:35|)) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) (|$knormal:18| Int) (|$knormal:19| Int) (|$knormal:20| Int) (|$knormal:21| Int) (|$knormal:22| Int) (|$knormal:23| Int) (|$knormal:24| Int) (|$knormal:25| Int) (|$knormal:26| Int) (|$knormal:27| Int) (|$knormal:28| Int) (|$knormal:29| Int) (|$knormal:30| Int) (|$knormal:31| Int) (|$knormal:32| Int) (|$knormal:33| Int) (|$knormal:34| Int) (|$knormal:35| Int) (|$knormal:38| Int) )
    (=>
      ( and (= |$knormal:38| 1) (= (not (= 0 |$knormal:35|)) (and (not (= 0 |$knormal:28|)) (not (= 0 |$knormal:34|)))) (= (not (= 0 |$knormal:34|)) (>= |$knormal:33| 0)) (= |$knormal:33| (+ |$knormal:31| |$knormal:32|)) (= |$knormal:32| 0) (= |$knormal:31| (+ |$knormal:29| |$knormal:30|)) (= |$knormal:30| |$alpha-7:xs_1031|) (= |$knormal:29| 0) (= (not (= 0 |$knormal:28|)) (> |$knormal:22| |$knormal:27|)) (= |$knormal:27| (+ |$knormal:25| |$knormal:26|)) (= |$knormal:26| 0) (= |$knormal:25| (+ |$knormal:23| |$knormal:24|)) (= |$knormal:24| |$alpha-7:xs_1031|) (= |$knormal:23| 0) (= |$knormal:22| (+ |$knormal:20| |$knormal:21|)) (= |$knormal:21| 0) (= |$knormal:20| (+ |$knormal:18| |$knormal:19|)) (= |$knormal:19| |$alpha-9:s_prev_zip_xs_1060|) (= |$knormal:18| 0) (not (not (= 0 |$knormal:35|))) (not (= 0 |$alpha-8:prev_set_flag_zip_1062|)) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true )
      (|fail$unknown:3| |$knormal:38|)
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) )
    (=>
      ( and (= |$alpha-13:u| 1) (not (not (= 0 |$alpha-8:prev_set_flag_zip_1062|))) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) )
    (=>
      ( and (= |$alpha-13:u| 1) (not (not (= 0 |$alpha-8:prev_set_flag_zip_1062|))) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) )
    (=>
      ( and (= |$alpha-13:u| 1) (not (not (= 0 |$alpha-8:prev_set_flag_zip_1062|))) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true )
      (|zip_1030$unknown:12| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|)
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) )
    (=>
      ( and (= |$alpha-13:u| 1) (not (not (= 0 |$alpha-8:prev_set_flag_zip_1062|))) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) )
    (=>
      ( and (= |$alpha-13:u| 1) (not (not (= 0 |$alpha-8:prev_set_flag_zip_1062|))) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) )
    (=>
      ( and (= |$alpha-13:u| 1) (not (not (= 0 |$alpha-8:prev_set_flag_zip_1062|))) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) )
    (=>
      ( and (= |$alpha-13:u| 1) (not (not (= 0 |$alpha-8:prev_set_flag_zip_1062|))) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-10:s_prev_zip_ys_1061| Int) (|$alpha-11:ys_1032| Int) (|$alpha-13:u| Int) (|$alpha-4:x_DO_NOT_CARE_1079| Int) (|$alpha-5:x_DO_NOT_CARE_1080| Int) (|$alpha-6:x_DO_NOT_CARE_1081| Int) (|$alpha-7:xs_1031| Int) (|$alpha-8:prev_set_flag_zip_1062| Int) (|$alpha-9:s_prev_zip_xs_1060| Int) )
    (=>
      ( and (= |$alpha-13:u| 1) (not (not (= 0 |$alpha-8:prev_set_flag_zip_1062|))) (|zip_1030$unknown:21| |$alpha-11:ys_1032| |$alpha-10:s_prev_zip_ys_1061| |$alpha-9:s_prev_zip_xs_1060| |$alpha-8:prev_set_flag_zip_1062| |$alpha-7:xs_1031| |$alpha-6:x_DO_NOT_CARE_1081| |$alpha-5:x_DO_NOT_CARE_1080| |$alpha-4:x_DO_NOT_CARE_1079|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$V-reftype:99| Int) (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) (|$knormal:58| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (= |$V-reftype:99| (+ 1 |$knormal:58|)) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true (|zip_1030$unknown:22| |$knormal:58| |$alpha-26:ys'_1034| |$alpha-21:ys_1032| |$alpha-17:xs_1031| |$alpha-22:set_flag_zip_1063| |$alpha-25:xs'_1033| |$alpha-21:ys_1032| |$alpha-17:xs_1031| |$alpha-22:set_flag_zip_1063|) )
      (|zip_without_checking_1077$unknown:31| |$V-reftype:99| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|)
    )
  )
)
(assert
  (forall ( (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$V-reftype:94| Int) (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$knormal:40| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-22:set_flag_zip_1063| 1) (= |$V-reftype:94| 0) (not (= 0 |$knormal:40|)) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true )
      (|zip_without_checking_1077$unknown:31| |$V-reftype:94| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|)
    )
  )
)
(assert
  (forall ( (|$V-reftype:97| Int) (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$knormal:40| Int) (|$knormal:41| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (= |$V-reftype:97| 0) (not (not (= 0 |$knormal:40|))) (not (= 0 |$knormal:41|)) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true )
      (|zip_without_checking_1077$unknown:31| |$V-reftype:97| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|)
    )
  )
)
(assert
  (forall ( (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-14:x_DO_NOT_CARE_1083| Int) (|$alpha-15:x_DO_NOT_CARE_1084| Int) (|$alpha-16:x_DO_NOT_CARE_1085| Int) (|$alpha-17:xs_1031| Int) (|$alpha-18:set_flag_zip_1063| Int) (|$alpha-19:s_zip_xs_1058| Int) (|$alpha-20:s_zip_ys_1059| Int) (|$alpha-21:ys_1032| Int) (|$alpha-22:set_flag_zip_1063| Int) (|$alpha-25:xs'_1033| Int) (|$alpha-26:ys'_1034| Int) (|$knormal:40| Int) (|$knormal:41| Int) )
    (=>
      ( and (= (not (= 0 |$knormal:41|)) (<= |$alpha-21:ys_1032| 0)) (= (not (= 0 |$knormal:40|)) (<= |$alpha-17:xs_1031| 0)) (= |$alpha-26:ys'_1034| (- |$alpha-21:ys_1032| 1)) (= |$alpha-25:xs'_1033| (- |$alpha-17:xs_1031| 1)) (= |$alpha-22:set_flag_zip_1063| 1) (not (not (= 0 |$knormal:41|))) (not (not (= 0 |$knormal:40|))) (|zip_without_checking_1077$unknown:30| |$alpha-21:ys_1032| |$alpha-20:s_zip_ys_1059| |$alpha-19:s_zip_xs_1058| |$alpha-18:set_flag_zip_1063| |$alpha-17:xs_1031| |$alpha-16:x_DO_NOT_CARE_1085| |$alpha-15:x_DO_NOT_CARE_1084| |$alpha-14:x_DO_NOT_CARE_1083|) true true true true true true true )
      (|zip_1030$unknown:21| |$alpha-26:ys'_1034| |$alpha-21:ys_1032| |$alpha-17:xs_1031| |$alpha-22:set_flag_zip_1063| |$alpha-25:xs'_1033| |$alpha-21:ys_1032| |$alpha-17:xs_1031| |$alpha-22:set_flag_zip_1063|)
    )
  )
)
(assert
  (forall ( (|$alpha-29:set_flag_zip_1063| Int) (|$alpha-30:s_zip_xs_1058| Int) (|$alpha-31:s_zip_ys_1059| Int) )
    (=>
      ( and (= |$alpha-31:s_zip_ys_1059| 0) (= |$alpha-30:s_zip_xs_1058| 0) (= |$alpha-29:set_flag_zip_1063| 0) )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-29:set_flag_zip_1063| Int) (|$alpha-30:s_zip_xs_1058| Int) (|$alpha-31:s_zip_ys_1059| Int) )
    (=>
      ( and (= |$alpha-31:s_zip_ys_1059| 0) (= |$alpha-30:s_zip_xs_1058| 0) (= |$alpha-29:set_flag_zip_1063| 0) )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-29:set_flag_zip_1063| Int) (|$alpha-30:s_zip_xs_1058| Int) (|$alpha-31:s_zip_ys_1059| Int) )
    (=>
      ( and (= |$alpha-31:s_zip_ys_1059| 0) (= |$alpha-30:s_zip_xs_1058| 0) (= |$alpha-29:set_flag_zip_1063| 0) )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-29:set_flag_zip_1063| Int) (|$alpha-30:s_zip_xs_1058| Int) (|$alpha-31:s_zip_ys_1059| Int) )
    (=>
      ( and (= |$alpha-31:s_zip_ys_1059| 0) (= |$alpha-30:s_zip_xs_1058| 0) (= |$alpha-29:set_flag_zip_1063| 0) )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-29:set_flag_zip_1063| Int) (|$alpha-30:s_zip_xs_1058| Int) (|$alpha-31:s_zip_ys_1059| Int) )
    (=>
      ( and (= |$alpha-31:s_zip_ys_1059| 0) (= |$alpha-30:s_zip_xs_1058| 0) (= |$alpha-29:set_flag_zip_1063| 0) )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-29:set_flag_zip_1063| Int) (|$alpha-30:s_zip_xs_1058| Int) (|$alpha-31:s_zip_ys_1059| Int) )
    (=>
      ( and (= |$alpha-31:s_zip_ys_1059| 0) (= |$alpha-30:s_zip_xs_1058| 0) (= |$alpha-29:set_flag_zip_1063| 0) )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-29:set_flag_zip_1063| Int) (|$alpha-30:s_zip_xs_1058| Int) (|$alpha-31:s_zip_ys_1059| Int) )
    (=>
      ( and (= |$alpha-31:s_zip_ys_1059| 0) (= |$alpha-30:s_zip_xs_1058| 0) (= |$alpha-29:set_flag_zip_1063| 0) )
      true
    )
  )
)
(assert
  (forall ( (|$alpha-27:l1_1037| Int) (|$alpha-28:l2_1038| Int) (|$alpha-29:set_flag_zip_1063| Int) (|$alpha-30:s_zip_xs_1058| Int) (|$alpha-31:s_zip_ys_1059| Int) )
    (=>
      ( and (= |$alpha-31:s_zip_ys_1059| 0) (= |$alpha-30:s_zip_xs_1058| 0) (= |$alpha-29:set_flag_zip_1063| 0) )
      (|zip_without_checking_1077$unknown:30| |$alpha-28:l2_1038| |$alpha-31:s_zip_ys_1059| |$alpha-30:s_zip_xs_1058| |$alpha-29:set_flag_zip_1063| |$alpha-27:l1_1037| |$alpha-31:s_zip_ys_1059| |$alpha-30:s_zip_xs_1058| |$alpha-29:set_flag_zip_1063|)
    )
  )
)
(check-sat)


(exit)

