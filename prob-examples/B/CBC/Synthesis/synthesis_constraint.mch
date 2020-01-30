MACHINE synthesis_constraint
CONSTANTS
 PID,li750,li751,li755,li756,li758,li759,li763,li764,li766,li767,li771,li772,li774,
 li775,lo752,lo754,lo757,lo760,lo762,lo765,lo768,lo770,lo773,lo776,lo77,
 p2,p1,lovalue02boolean,linput22set,linput12set,linput02set,
 constant753,constant761,constant769,p3,lovalue03boolean,
 linput23set,linput13set,linput03set,lovalue04boolean,linput24set,linput14set,
 linput04set,lovalue07boolean,linput27set,linput17set,linput07set,
 lovalue010boolean,linput210set,linput110set,linput010set,
 lovalue012boolean,linput212set,linput112set,linput012set,
 lovalue013boolean,linput213set,linput113set,linput013set

PROPERTIES

PID = {1,2,3} &
li750 : 0 .. 11
&
li751 : 0 .. 11
&
li755 : 0 .. 11
&
li756 : 0 .. 11
&
li758 : 0 .. 11
&
li759 : 0 .. 11
&
li763 : 0 .. 11
&
li764 : 0 .. 11
&
li766 : 0 .. 11
&
li767 : 0 .. 11
&
li771 : 0 .. 11
&
li772 : 0 .. 11
&
li774 : 0 .. 11
&
li775 : 0 .. 11
&
lo752 : 3 .. 12
&
lo754 : 3 .. 12
&
lo757 : 3 .. 12
&
lo760 : 3 .. 12
&
lo762 : 3 .. 12
&
lo765 : 3 .. 12
&
lo768 : 3 .. 12
&
lo770 : 3 .. 12
&
lo773 : 3 .. 12
&
lo776 : 3 .. 12
&
lo752 /= lo754
&
lo752 /= lo757
&
lo752 /= lo760
&
lo752 /= lo762
&
lo752 /= lo765
&
lo752 /= lo768
&
lo752 /= lo770
&
lo752 /= lo773
&
lo752 /= lo776
&
lo754 /= lo757
&
lo754 /= lo760
&
lo754 /= lo762
&
lo754 /= lo765
&
lo754 /= lo768
&
lo754 /= lo770
&
lo754 /= lo773
&
lo754 /= lo776
&
lo757 /= lo760
&
lo757 /= lo762
&
lo757 /= lo765
&
lo757 /= lo768
&
lo757 /= lo770
&
lo757 /= lo773
&
lo757 /= lo776
&
lo760 /= lo762
&
lo760 /= lo765
&
lo760 /= lo768
&
lo760 /= lo770
&
lo760 /= lo773
&
lo760 /= lo776
&
lo762 /= lo765
&
lo762 /= lo768
&
lo762 /= lo770
&
lo762 /= lo773
&
lo762 /= lo776
&
lo765 /= lo768
&
lo765 /= lo770
&
lo765 /= lo773
&
lo765 /= lo776
&
lo768 /= lo770
&
lo768 /= lo773
&
lo768 /= lo776
&
lo770 /= lo773
&
lo770 /= lo776
&
lo773 /= lo776
&
li750 < lo752
&
li751 < lo752
&
li755 < lo757
&
li756 < lo757
&
li758 < lo760
&
li759 < lo760
&
li763 < lo765
&
li764 < lo765
&
li766 < lo768
&
li767 < lo768
&
li771 < lo773
&
li772 < lo773
&
li774 < lo776
&
li775 < lo77
&
#(o776,o773,o770,o768,o765,o762,o760,o757,o754,o752,i775,i774,i772,i771,i767,i766,i764,i763,i759,i758,i756,i755,i751,i750,waiting,ready,active).(
  (
    waiting : POW(PID)
    &
    ready : POW(PID)
    &
    active : POW(PID)
    &
    active = {p2}
    &
    ready = {}
    &
    waiting = {p1}
    &
    lovalue02boolean = 12
    &
    linput22set = 2
    &
    linput12set = 1
    &
    linput02set = 0
    &
    (
      (
        i750 = TRUE
        &
        i751 = TRUE
        &
        o752 = TRUE
      )
      or
      (
        (
          i750 = FALSE
          or
          i751 = FALSE
        )
        &
        o752 = FALSE
      )
    )
    &
    constant753 = o754
    &
    (
      i755 = i756
      <=>
      o757 = TRUE
    )
    &
    (
      i758 /= i759
      <=>
      o760 = TRUE
    )
    &
    constant761 = o762
    &
    (
      i763 = i764
      <=>
      o765 = TRUE
    )
    &
    (
      i766 /= i767
      <=>
      o768 = TRUE
    )
    &
    constant769 = o770
    &
    (
      i771 = i772
      <=>
      o773 = TRUE
    )
    &
    (
      i774 /= i775
      <=>
      o776 = TRUE
    )
    &
    li774 <= li775
    &
    li771 <= li772
    &
    li766 <= li767
    &
    li763 <= li764
    &
    li758 <= li759
    &
    li755 <= li756
    &
    li750 <= li751
    &
    (
      li750 = li751
      =>
      i750 = i751
    )
    &
    li750 /= li755
    &
    li750 /= li756
    &
    li750 /= li758
    &
    li750 /= li759
    &
    li750 /= li763
    &
    li750 /= li764
    &
    li750 /= li766
    &
    li750 /= li767
    &
    li750 /= li771
    &
    li750 /= li772
    &
    li750 /= li774
    &
    li750 /= li775
    &
    (
      li750 = lo752
      =>
      i750 = o752
    )
    &
    li750 /= lo754
    &
    (
      li750 = lo757
      =>
      i750 = o757
    )
    &
    (
      li750 = lo760
      =>
      i750 = o760
    )
    &
    li750 /= lo762
    &
    (
      li750 = lo765
      =>
      i750 = o765
    )
    &
    (
      li750 = lo768
      =>
      i750 = o768
    )
    &
    li750 /= lo770
    &
    (
      li750 = lo773
      =>
      i750 = o773
    )
    &
    (
      li750 = lo776
      =>
      i750 = o776
    )
    &
    li750 /= linput02set
    &
    li750 /= linput12set
    &
    li750 /= linput22set
    &
    (
      li750 = lovalue02boolean
      =>
      i750 = TRUE
    )
    &
    li751 /= li755
    &
    li751 /= li756
    &
    li751 /= li758
    &
    li751 /= li759
    &
    li751 /= li763
    &
    li751 /= li764
    &
    li751 /= li766
    &
    li751 /= li767
    &
    li751 /= li771
    &
    li751 /= li772
    &
    li751 /= li774
    &
    li751 /= li775
    &
    (
      li751 = lo752
      =>
      i751 = o752
    )
    &
    li751 /= lo754
    &
    (
      li751 = lo757
      =>
      i751 = o757
    )
    &
    (
      li751 = lo760
      =>
      i751 = o760
    )
    &
    li751 /= lo762
    &
    (
      li751 = lo765
      =>
      i751 = o765
    )
    &
    (
      li751 = lo768
      =>
      i751 = o768
    )
    &
    li751 /= lo770
    &
    (
      li751 = lo773
      =>
      i751 = o773
    )
    &
    (
      li751 = lo776
      =>
      i751 = o776
    )
    &
    li751 /= linput02set
    &
    li751 /= linput12set
    &
    li751 /= linput22set
    &
    (
      li751 = lovalue02boolean
      =>
      i751 = TRUE
    )
    &
    (
      li755 = li756
      =>
      i755 = i756
    )
    &
    (
      li755 = li758
      =>
      i755 = i758
    )
    &
    (
      li755 = li759
      =>
      i755 = i759
    )
    &
    (
      li755 = li763
      =>
      i755 = i763
    )
    &
    (
      li755 = li764
      =>
      i755 = i764
    )
    &
    (
      li755 = li766
      =>
      i755 = i766
    )
    &
    (
      li755 = li767
      =>
      i755 = i767
    )
    &
    (
      li755 = li771
      =>
      i755 = i771
    )
    &
    (
      li755 = li772
      =>
      i755 = i772
    )
    &
    (
      li755 = li774
      =>
      i755 = i774
    )
    &
    (
      li755 = li775
      =>
      i755 = i775
    )
    &
    li755 /= lo752
    &
    (
      li755 = lo754
      =>
      i755 = o754
    )
    &
    li755 /= lo757
    &
    li755 /= lo760
    &
    (
      li755 = lo762
      =>
      i755 = o762
    )
    &
    li755 /= lo765
    &
    li755 /= lo768
    &
    (
      li755 = lo770
      =>
      i755 = o770
    )
    &
    li755 /= lo773
    &
    li755 /= lo776
    &
    (
      li755 = linput02set
      =>
      i755 = {p1}
    )
    &
    (
      li755 = linput12set
      =>
      i755 = {}
    )
    &
    (
      li755 = linput22set
      =>
      i755 = {p2}
    )
    &
    li755 /= lovalue02boolean
    &
    (
      li756 = li758
      =>
      i756 = i758
    )
    &
    (
      li756 = li759
      =>
      i756 = i759
    )
    &
    (
      li756 = li763
      =>
      i756 = i763
    )
    &
    (
      li756 = li764
      =>
      i756 = i764
    )
    &
    (
      li756 = li766
      =>
      i756 = i766
    )
    &
    (
      li756 = li767
      =>
      i756 = i767
    )
    &
    (
      li756 = li771
      =>
      i756 = i771
    )
    &
    (
      li756 = li772
      =>
      i756 = i772
    )
    &
    (
      li756 = li774
      =>
      i756 = i774
    )
    &
    (
      li756 = li775
      =>
      i756 = i775
    )
    &
    li756 /= lo752
    &
    (
      li756 = lo754
      =>
      i756 = o754
    )
    &
    li756 /= lo757
    &
    li756 /= lo760
    &
    (
      li756 = lo762
      =>
      i756 = o762
    )
    &
    li756 /= lo765
    &
    li756 /= lo768
    &
    (
      li756 = lo770
      =>
      i756 = o770
    )
    &
    li756 /= lo773
    &
    li756 /= lo776
    &
    (
      li756 = linput02set
      =>
      i756 = {p1}
    )
    &
    (
      li756 = linput12set
      =>
      i756 = {}
    )
    &
    (
      li756 = linput22set
      =>
      i756 = {p2}
    )
    &
    li756 /= lovalue02boolean
    &
    (
      li758 = li759
      =>
      i758 = i759
    )
    &
    (
      li758 = li763
      =>
      i758 = i763
    )
    &
    (
      li758 = li764
      =>
      i758 = i764
    )
    &
    (
      li758 = li766
      =>
      i758 = i766
    )
    &
    (
      li758 = li767
      =>
      i758 = i767
    )
    &
    (
      li758 = li771
      =>
      i758 = i771
    )
    &
    (
      li758 = li772
      =>
      i758 = i772
    )
    &
    (
      li758 = li774
      =>
      i758 = i774
    )
    &
    (
      li758 = li775
      =>
      i758 = i775
    )
    &
    li758 /= lo752
    &
    (
      li758 = lo754
      =>
      i758 = o754
    )
    &
    li758 /= lo757
    &
    li758 /= lo760
    &
    (
      li758 = lo762
      =>
      i758 = o762
    )
    &
    li758 /= lo765
    &
    li758 /= lo768
    &
    (
      li758 = lo770
      =>
      i758 = o770
    )
    &
    li758 /= lo773
    &
    li758 /= lo776
    &
    (
      li758 = linput02set
      =>
      i758 = {p1}
    )
    &
    (
      li758 = linput12set
      =>
      i758 = {}
    )
    &
    (
      li758 = linput22set
      =>
      i758 = {p2}
    )
    &
    li758 /= lovalue02boolean
    &
    (
      li759 = li763
      =>
      i759 = i763
    )
    &
    (
      li759 = li764
      =>
      i759 = i764
    )
    &
    (
      li759 = li766
      =>
      i759 = i766
    )
    &
    (
      li759 = li767
      =>
      i759 = i767
    )
    &
    (
      li759 = li771
      =>
      i759 = i771
    )
    &
    (
      li759 = li772
      =>
      i759 = i772
    )
    &
    (
      li759 = li774
      =>
      i759 = i774
    )
    &
    (
      li759 = li775
      =>
      i759 = i775
    )
    &
    li759 /= lo752
    &
    (
      li759 = lo754
      =>
      i759 = o754
    )
    &
    li759 /= lo757
    &
    li759 /= lo760
    &
    (
      li759 = lo762
      =>
      i759 = o762
    )
    &
    li759 /= lo765
    &
    li759 /= lo768
    &
    (
      li759 = lo770
      =>
      i759 = o770
    )
    &
    li759 /= lo773
    &
    li759 /= lo776
    &
    (
      li759 = linput02set
      =>
      i759 = {p1}
    )
    &
    (
      li759 = linput12set
      =>
      i759 = {}
    )
    &
    (
      li759 = linput22set
      =>
      i759 = {p2}
    )
    &
    li759 /= lovalue02boolean
    &
    (
      li763 = li764
      =>
      i763 = i764
    )
    &
    (
      li763 = li766
      =>
      i763 = i766
    )
    &
    (
      li763 = li767
      =>
      i763 = i767
    )
    &
    (
      li763 = li771
      =>
      i763 = i771
    )
    &
    (
      li763 = li772
      =>
      i763 = i772
    )
    &
    (
      li763 = li774
      =>
      i763 = i774
    )
    &
    (
      li763 = li775
      =>
      i763 = i775
    )
    &
    li763 /= lo752
    &
    (
      li763 = lo754
      =>
      i763 = o754
    )
    &
    li763 /= lo757
    &
    li763 /= lo760
    &
    (
      li763 = lo762
      =>
      i763 = o762
    )
    &
    li763 /= lo765
    &
    li763 /= lo768
    &
    (
      li763 = lo770
      =>
      i763 = o770
    )
    &
    li763 /= lo773
    &
    li763 /= lo776
    &
    (
      li763 = linput02set
      =>
      i763 = {p1}
    )
    &
    (
      li763 = linput12set
      =>
      i763 = {}
    )
    &
    (
      li763 = linput22set
      =>
      i763 = {p2}
    )
    &
    li763 /= lovalue02boolean
    &
    (
      li764 = li766
      =>
      i764 = i766
    )
    &
    (
      li764 = li767
      =>
      i764 = i767
    )
    &
    (
      li764 = li771
      =>
      i764 = i771
    )
    &
    (
      li764 = li772
      =>
      i764 = i772
    )
    &
    (
      li764 = li774
      =>
      i764 = i774
    )
    &
    (
      li764 = li775
      =>
      i764 = i775
    )
    &
    li764 /= lo752
    &
    (
      li764 = lo754
      =>
      i764 = o754
    )
    &
    li764 /= lo757
    &
    li764 /= lo760
    &
    (
      li764 = lo762
      =>
      i764 = o762
    )
    &
    li764 /= lo765
    &
    li764 /= lo768
    &
    (
      li764 = lo770
      =>
      i764 = o770
    )
    &
    li764 /= lo773
    &
    li764 /= lo776
    &
    (
      li764 = linput02set
      =>
      i764 = {p1}
    )
    &
    (
      li764 = linput12set
      =>
      i764 = {}
    )
    &
    (
      li764 = linput22set
      =>
      i764 = {p2}
    )
    &
    li764 /= lovalue02boolean
    &
    (
      li766 = li767
      =>
      i766 = i767
    )
    &
    (
      li766 = li771
      =>
      i766 = i771
    )
    &
    (
      li766 = li772
      =>
      i766 = i772
    )
    &
    (
      li766 = li774
      =>
      i766 = i774
    )
    &
    (
      li766 = li775
      =>
      i766 = i775
    )
    &
    li766 /= lo752
    &
    (
      li766 = lo754
      =>
      i766 = o754
    )
    &
    li766 /= lo757
    &
    li766 /= lo760
    &
    (
      li766 = lo762
      =>
      i766 = o762
    )
    &
    li766 /= lo765
    &
    li766 /= lo768
    &
    (
      li766 = lo770
      =>
      i766 = o770
    )
    &
    li766 /= lo773
    &
    li766 /= lo776
    &
    (
      li766 = linput02set
      =>
      i766 = {p1}
    )
    &
    (
      li766 = linput12set
      =>
      i766 = {}
    )
    &
    (
      li766 = linput22set
      =>
      i766 = {p2}
    )
    &
    li766 /= lovalue02boolean
    &
    (
      li767 = li771
      =>
      i767 = i771
    )
    &
    (
      li767 = li772
      =>
      i767 = i772
    )
    &
    (
      li767 = li774
      =>
      i767 = i774
    )
    &
    (
      li767 = li775
      =>
      i767 = i775
    )
    &
    li767 /= lo752
    &
    (
      li767 = lo754
      =>
      i767 = o754
    )
    &
    li767 /= lo757
    &
    li767 /= lo760
    &
    (
      li767 = lo762
      =>
      i767 = o762
    )
    &
    li767 /= lo765
    &
    li767 /= lo768
    &
    (
      li767 = lo770
      =>
      i767 = o770
    )
    &
    li767 /= lo773
    &
    li767 /= lo776
    &
    (
      li767 = linput02set
      =>
      i767 = {p1}
    )
    &
    (
      li767 = linput12set
      =>
      i767 = {}
    )
    &
    (
      li767 = linput22set
      =>
      i767 = {p2}
    )
    &
    li767 /= lovalue02boolean
    &
    (
      li771 = li772
      =>
      i771 = i772
    )
    &
    (
      li771 = li774
      =>
      i771 = i774
    )
    &
    (
      li771 = li775
      =>
      i771 = i775
    )
    &
    li771 /= lo752
    &
    (
      li771 = lo754
      =>
      i771 = o754
    )
    &
    li771 /= lo757
    &
    li771 /= lo760
    &
    (
      li771 = lo762
      =>
      i771 = o762
    )
    &
    li771 /= lo765
    &
    li771 /= lo768
    &
    (
      li771 = lo770
      =>
      i771 = o770
    )
    &
    li771 /= lo773
    &
    li771 /= lo776
    &
    (
      li771 = linput02set
      =>
      i771 = {p1}
    )
    &
    (
      li771 = linput12set
      =>
      i771 = {}
    )
    &
    (
      li771 = linput22set
      =>
      i771 = {p2}
    )
    &
    li771 /= lovalue02boolean
    &
    (
      li772 = li774
      =>
      i772 = i774
    )
    &
    (
      li772 = li775
      =>
      i772 = i775
    )
    &
    li772 /= lo752
    &
    (
      li772 = lo754
      =>
      i772 = o754
    )
    &
    li772 /= lo757
    &
    li772 /= lo760
    &
    (
      li772 = lo762
      =>
      i772 = o762
    )
    &
    li772 /= lo765
    &
    li772 /= lo768
    &
    (
      li772 = lo770
      =>
      i772 = o770
    )
    &
    li772 /= lo773
    &
    li772 /= lo776
    &
    (
      li772 = linput02set
      =>
      i772 = {p1}
    )
    &
    (
      li772 = linput12set
      =>
      i772 = {}
    )
    &
    (
      li772 = linput22set
      =>
      i772 = {p2}
    )
    &
    li772 /= lovalue02boolean
    &
    (
      li774 = li775
      =>
      i774 = i775
    )
    &
    li774 /= lo752
    &
    (
      li774 = lo754
      =>
      i774 = o754
    )
    &
    li774 /= lo757
    &
    li774 /= lo760
    &
    (
      li774 = lo762
      =>
      i774 = o762
    )
    &
    li774 /= lo765
    &
    li774 /= lo768
    &
    (
      li774 = lo770
      =>
      i774 = o770
    )
    &
    li774 /= lo773
    &
    li774 /= lo776
    &
    (
      li774 = linput02set
      =>
      i774 = {p1}
    )
    &
    (
      li774 = linput12set
      =>
      i774 = {}
    )
    &
    (
      li774 = linput22set
      =>
      i774 = {p2}
    )
    &
    li774 /= lovalue02boolean
    &
    li775 /= lo752
    &
    (
      li775 = lo754
      =>
      i775 = o754
    )
    &
    li775 /= lo757
    &
    li775 /= lo760
    &
    (
      li775 = lo762
      =>
      i775 = o762
    )
    &
    li775 /= lo765
    &
    li775 /= lo768
    &
    (
      li775 = lo770
      =>
      i775 = o770
    )
    &
    li775 /= lo773
    &
    li775 /= lo776
    &
    (
      li775 = linput02set
      =>
      i775 = {p1}
    )
    &
    (
      li775 = linput12set
      =>
      i775 = {}
    )
    &
    (
      li775 = linput22set
      =>
      i775 = {p2}
    )
    &
    li775 /= lovalue02boolean
    &
    lo752 /= lo754
    &
    (
      lo752 = lo757
      =>
      o752 = o757
    )
    &
    (
      lo752 = lo760
      =>
      o752 = o760
    )
    &
    lo752 /= lo762
    &
    (
      lo752 = lo765
      =>
      o752 = o765
    )
    &
    (
      lo752 = lo768
      =>
      o752 = o768
    )
    &
    lo752 /= lo770
    &
    (
      lo752 = lo773
      =>
      o752 = o773
    )
    &
    (
      lo752 = lo776
      =>
      o752 = o776
    )
    &
    lo752 /= linput02set
    &
    lo752 /= linput12set
    &
    lo752 /= linput22set
    &
    (
      lo752 = lovalue02boolean
      =>
      o752 = TRUE
    )
    &
    lo754 /= lo757
    &
    lo754 /= lo760
    &
    (
      lo754 = lo762
      =>
      o754 = o762
    )
    &
    lo754 /= lo765
    &
    lo754 /= lo768
    &
    (
      lo754 = lo770
      =>
      o754 = o770
    )
    &
    lo754 /= lo773
    &
    lo754 /= lo776
    &
    (
      lo754 = linput02set
      =>
      o754 = {p1}
    )
    &
    (
      lo754 = linput12set
      =>
      o754 = {}
    )
    &
    (
      lo754 = linput22set
      =>
      o754 = {p2}
    )
    &
    lo754 /= lovalue02boolean
    &
    (
      lo757 = lo760
      =>
      o757 = o760
    )
    &
    lo757 /= lo762
    &
    (
      lo757 = lo765
      =>
      o757 = o765
    )
    &
    (
      lo757 = lo768
      =>
      o757 = o768
    )
    &
    lo757 /= lo770
    &
    (
      lo757 = lo773
      =>
      o757 = o773
    )
    &
    (
      lo757 = lo776
      =>
      o757 = o776
    )
    &
    lo757 /= linput02set
    &
    lo757 /= linput12set
    &
    lo757 /= linput22set
    &
    (
      lo757 = lovalue02boolean
      =>
      o757 = TRUE
    )
    &
    lo760 /= lo762
    &
    (
      lo760 = lo765
      =>
      o760 = o765
    )
    &
    (
      lo760 = lo768
      =>
      o760 = o768
    )
    &
    lo760 /= lo770
    &
    (
      lo760 = lo773
      =>
      o760 = o773
    )
    &
    (
      lo760 = lo776
      =>
      o760 = o776
    )
    &
    lo760 /= linput02set
    &
    lo760 /= linput12set
    &
    lo760 /= linput22set
    &
    (
      lo760 = lovalue02boolean
      =>
      o760 = TRUE
    )
    &
    lo762 /= lo765
    &
    lo762 /= lo768
    &
    (
      lo762 = lo770
      =>
      o762 = o770
    )
    &
    lo762 /= lo773
    &
    lo762 /= lo776
    &
    (
      lo762 = linput02set
      =>
      o762 = {p1}
    )
    &
    (
      lo762 = linput12set
      =>
      o762 = {}
    )
    &
    (
      lo762 = linput22set
      =>
      o762 = {p2}
    )
    &
    lo762 /= lovalue02boolean
    &
    (
      lo765 = lo768
      =>
      o765 = o768
    )
    &
    lo765 /= lo770
    &
    (
      lo765 = lo773
      =>
      o765 = o773
    )
    &
    (
      lo765 = lo776
      =>
      o765 = o776
    )
    &
    lo765 /= linput02set
    &
    lo765 /= linput12set
    &
    lo765 /= linput22set
    &
    (
      lo765 = lovalue02boolean
      =>
      o765 = TRUE
    )
    &
    lo768 /= lo770
    &
    (
      lo768 = lo773
      =>
      o768 = o773
    )
    &
    (
      lo768 = lo776
      =>
      o768 = o776
    )
    &
    lo768 /= linput02set
    &
    lo768 /= linput12set
    &
    lo768 /= linput22set
    &
    (
      lo768 = lovalue02boolean
      =>
      o768 = TRUE
    )
    &
    lo770 /= lo773
    &
    lo770 /= lo776
    &
    (
      lo770 = linput02set
      =>
      o770 = {p1}
    )
    &
    (
      lo770 = linput12set
      =>
      o770 = {}
    )
    &
    (
      lo770 = linput22set
      =>
      o770 = {p2}
    )
    &
    lo770 /= lovalue02boolean
    &
    (
      lo773 = lo776
      =>
      o773 = o776
    )
    &
    lo773 /= linput02set
    &
    lo773 /= linput12set
    &
    lo773 /= linput22set
    &
    (
      lo773 = lovalue02boolean
      =>
      o773 = TRUE
    )
    &
    lo776 /= linput02set
    &
    lo776 /= linput12set
    &
    lo776 /= linput22set
    &
    (
      lo776 = lovalue02boolean
      =>
      o776 = TRUE
    )
    &
    (
      linput02set = linput12set
      =>
      {p1} = {}
    )
    &
    (
      linput02set = linput22set
      =>
      {p1} = {p2}
    )
    &
    linput02set /= lovalue02boolean
    &
    (
      linput12set = linput22set
      =>
      {} = {p2}
    )
    &
    linput12set /= lovalue02boolean
    &
    linput22set /= lovalue02boolean
    &
    card(i755) <= 5
    &
    card(i756) <= 5
    &
    card(i758) <= 5
    &
    card(i759) <= 5
    &
    card(i763) <= 5
    &
    card(i764) <= 5
    &
    card(i766) <= 5
    &
    card(i767) <= 5
    &
    card(i771) <= 5
    &
    card(i772) <= 5
    &
    card(i774) <= 5
    &
    card(i775) <= 5
    &
    card(o754) <= 5
    &
    card(o762) <= 5
    &
    card(o770) <= 5
  )
)
&
#(o776,o773,o770,o768,o765,o762,o760,o757,o754,o752,i775,i774,i772,i771,i767,i766,i764,i763,i759,i758,i756,i755,i751,i750,waiting,ready,active).(
  (
    waiting : POW(PID)
    &
    ready : POW(PID)
    &
    active : POW(PID)
    &
    active = {p3}
    &
    ready = {}
    &
    waiting = {p1,p2}
    &
    lovalue03boolean = 12
    &
    linput23set = 2
    &
    linput13set = 1
    &
    linput03set = 0
    &
    (
      (
        i750 = TRUE
        &
        i751 = TRUE
        &
        o752 = TRUE
      )
      or
      (
        (
          i750 = FALSE
          or
          i751 = FALSE
        )
        &
        o752 = FALSE
      )
    )
    &
    constant753 = o754
    &
    (
      i755 = i756
      <=>
      o757 = TRUE
    )
    &
    (
      i758 /= i759
      <=>
      o760 = TRUE
    )
    &
    constant761 = o762
    &
    (
      i763 = i764
      <=>
      o765 = TRUE
    )
    &
    (
      i766 /= i767
      <=>
      o768 = TRUE
    )
    &
    constant769 = o770
    &
    (
      i771 = i772
      <=>
      o773 = TRUE
    )
    &
    (
      i774 /= i775
      <=>
      o776 = TRUE
    )
    &
    li774 <= li775
    &
    li771 <= li772
    &
    li766 <= li767
    &
    li763 <= li764
    &
    li758 <= li759
    &
    li755 <= li756
    &
    li750 <= li751
    &
    (
      li750 = li751
      =>
      i750 = i751
    )
    &
    li750 /= li755
    &
    li750 /= li756
    &
    li750 /= li758
    &
    li750 /= li759
    &
    li750 /= li763
    &
    li750 /= li764
    &
    li750 /= li766
    &
    li750 /= li767
    &
    li750 /= li771
    &
    li750 /= li772
    &
    li750 /= li774
    &
    li750 /= li775
    &
    (
      li750 = lo752
      =>
      i750 = o752
    )
    &
    li750 /= lo754
    &
    (
      li750 = lo757
      =>
      i750 = o757
    )
    &
    (
      li750 = lo760
      =>
      i750 = o760
    )
    &
    li750 /= lo762
    &
    (
      li750 = lo765
      =>
      i750 = o765
    )
    &
    (
      li750 = lo768
      =>
      i750 = o768
    )
    &
    li750 /= lo770
    &
    (
      li750 = lo773
      =>
      i750 = o773
    )
    &
    (
      li750 = lo776
      =>
      i750 = o776
    )
    &
    li750 /= linput03set
    &
    li750 /= linput13set
    &
    li750 /= linput23set
    &
    (
      li750 = lovalue03boolean
      =>
      i750 = TRUE
    )
    &
    li751 /= li755
    &
    li751 /= li756
    &
    li751 /= li758
    &
    li751 /= li759
    &
    li751 /= li763
    &
    li751 /= li764
    &
    li751 /= li766
    &
    li751 /= li767
    &
    li751 /= li771
    &
    li751 /= li772
    &
    li751 /= li774
    &
    li751 /= li775
    &
    (
      li751 = lo752
      =>
      i751 = o752
    )
    &
    li751 /= lo754
    &
    (
      li751 = lo757
      =>
      i751 = o757
    )
    &
    (
      li751 = lo760
      =>
      i751 = o760
    )
    &
    li751 /= lo762
    &
    (
      li751 = lo765
      =>
      i751 = o765
    )
    &
    (
      li751 = lo768
      =>
      i751 = o768
    )
    &
    li751 /= lo770
    &
    (
      li751 = lo773
      =>
      i751 = o773
    )
    &
    (
      li751 = lo776
      =>
      i751 = o776
    )
    &
    li751 /= linput03set
    &
    li751 /= linput13set
    &
    li751 /= linput23set
    &
    (
      li751 = lovalue03boolean
      =>
      i751 = TRUE
    )
    &
    (
      li755 = li756
      =>
      i755 = i756
    )
    &
    (
      li755 = li758
      =>
      i755 = i758
    )
    &
    (
      li755 = li759
      =>
      i755 = i759
    )
    &
    (
      li755 = li763
      =>
      i755 = i763
    )
    &
    (
      li755 = li764
      =>
      i755 = i764
    )
    &
    (
      li755 = li766
      =>
      i755 = i766
    )
    &
    (
      li755 = li767
      =>
      i755 = i767
    )
    &
    (
      li755 = li771
      =>
      i755 = i771
    )
    &
    (
      li755 = li772
      =>
      i755 = i772
    )
    &
    (
      li755 = li774
      =>
      i755 = i774
    )
    &
    (
      li755 = li775
      =>
      i755 = i775
    )
    &
    li755 /= lo752
    &
    (
      li755 = lo754
      =>
      i755 = o754
    )
    &
    li755 /= lo757
    &
    li755 /= lo760
    &
    (
      li755 = lo762
      =>
      i755 = o762
    )
    &
    li755 /= lo765
    &
    li755 /= lo768
    &
    (
      li755 = lo770
      =>
      i755 = o770
    )
    &
    li755 /= lo773
    &
    li755 /= lo776
    &
    (
      li755 = linput03set
      =>
      i755 = {p1,p2}
    )
    &
    (
      li755 = linput13set
      =>
      i755 = {}
    )
    &
    (
      li755 = linput23set
      =>
      i755 = {p3}
    )
    &
    li755 /= lovalue03boolean
    &
    (
      li756 = li758
      =>
      i756 = i758
    )
    &
    (
      li756 = li759
      =>
      i756 = i759
    )
    &
    (
      li756 = li763
      =>
      i756 = i763
    )
    &
    (
      li756 = li764
      =>
      i756 = i764
    )
    &
    (
      li756 = li766
      =>
      i756 = i766
    )
    &
    (
      li756 = li767
      =>
      i756 = i767
    )
    &
    (
      li756 = li771
      =>
      i756 = i771
    )
    &
    (
      li756 = li772
      =>
      i756 = i772
    )
    &
    (
      li756 = li774
      =>
      i756 = i774
    )
    &
    (
      li756 = li775
      =>
      i756 = i775
    )
    &
    li756 /= lo752
    &
    (
      li756 = lo754
      =>
      i756 = o754
    )
    &
    li756 /= lo757
    &
    li756 /= lo760
    &
    (
      li756 = lo762
      =>
      i756 = o762
    )
    &
    li756 /= lo765
    &
    li756 /= lo768
    &
    (
      li756 = lo770
      =>
      i756 = o770
    )
    &
    li756 /= lo773
    &
    li756 /= lo776
    &
    (
      li756 = linput03set
      =>
      i756 = {p1,p2}
    )
    &
    (
      li756 = linput13set
      =>
      i756 = {}
    )
    &
    (
      li756 = linput23set
      =>
      i756 = {p3}
    )
    &
    li756 /= lovalue03boolean
    &
    (
      li758 = li759
      =>
      i758 = i759
    )
    &
    (
      li758 = li763
      =>
      i758 = i763
    )
    &
    (
      li758 = li764
      =>
      i758 = i764
    )
    &
    (
      li758 = li766
      =>
      i758 = i766
    )
    &
    (
      li758 = li767
      =>
      i758 = i767
    )
    &
    (
      li758 = li771
      =>
      i758 = i771
    )
    &
    (
      li758 = li772
      =>
      i758 = i772
    )
    &
    (
      li758 = li774
      =>
      i758 = i774
    )
    &
    (
      li758 = li775
      =>
      i758 = i775
    )
    &
    li758 /= lo752
    &
    (
      li758 = lo754
      =>
      i758 = o754
    )
    &
    li758 /= lo757
    &
    li758 /= lo760
    &
    (
      li758 = lo762
      =>
      i758 = o762
    )
    &
    li758 /= lo765
    &
    li758 /= lo768
    &
    (
      li758 = lo770
      =>
      i758 = o770
    )
    &
    li758 /= lo773
    &
    li758 /= lo776
    &
    (
      li758 = linput03set
      =>
      i758 = {p1,p2}
    )
    &
    (
      li758 = linput13set
      =>
      i758 = {}
    )
    &
    (
      li758 = linput23set
      =>
      i758 = {p3}
    )
    &
    li758 /= lovalue03boolean
    &
    (
      li759 = li763
      =>
      i759 = i763
    )
    &
    (
      li759 = li764
      =>
      i759 = i764
    )
    &
    (
      li759 = li766
      =>
      i759 = i766
    )
    &
    (
      li759 = li767
      =>
      i759 = i767
    )
    &
    (
      li759 = li771
      =>
      i759 = i771
    )
    &
    (
      li759 = li772
      =>
      i759 = i772
    )
    &
    (
      li759 = li774
      =>
      i759 = i774
    )
    &
    (
      li759 = li775
      =>
      i759 = i775
    )
    &
    li759 /= lo752
    &
    (
      li759 = lo754
      =>
      i759 = o754
    )
    &
    li759 /= lo757
    &
    li759 /= lo760
    &
    (
      li759 = lo762
      =>
      i759 = o762
    )
    &
    li759 /= lo765
    &
    li759 /= lo768
    &
    (
      li759 = lo770
      =>
      i759 = o770
    )
    &
    li759 /= lo773
    &
    li759 /= lo776
    &
    (
      li759 = linput03set
      =>
      i759 = {p1,p2}
    )
    &
    (
      li759 = linput13set
      =>
      i759 = {}
    )
    &
    (
      li759 = linput23set
      =>
      i759 = {p3}
    )
    &
    li759 /= lovalue03boolean
    &
    (
      li763 = li764
      =>
      i763 = i764
    )
    &
    (
      li763 = li766
      =>
      i763 = i766
    )
    &
    (
      li763 = li767
      =>
      i763 = i767
    )
    &
    (
      li763 = li771
      =>
      i763 = i771
    )
    &
    (
      li763 = li772
      =>
      i763 = i772
    )
    &
    (
      li763 = li774
      =>
      i763 = i774
    )
    &
    (
      li763 = li775
      =>
      i763 = i775
    )
    &
    li763 /= lo752
    &
    (
      li763 = lo754
      =>
      i763 = o754
    )
    &
    li763 /= lo757
    &
    li763 /= lo760
    &
    (
      li763 = lo762
      =>
      i763 = o762
    )
    &
    li763 /= lo765
    &
    li763 /= lo768
    &
    (
      li763 = lo770
      =>
      i763 = o770
    )
    &
    li763 /= lo773
    &
    li763 /= lo776
    &
    (
      li763 = linput03set
      =>
      i763 = {p1,p2}
    )
    &
    (
      li763 = linput13set
      =>
      i763 = {}
    )
    &
    (
      li763 = linput23set
      =>
      i763 = {p3}
    )
    &
    li763 /= lovalue03boolean
    &
    (
      li764 = li766
      =>
      i764 = i766
    )
    &
    (
      li764 = li767
      =>
      i764 = i767
    )
    &
    (
      li764 = li771
      =>
      i764 = i771
    )
    &
    (
      li764 = li772
      =>
      i764 = i772
    )
    &
    (
      li764 = li774
      =>
      i764 = i774
    )
    &
    (
      li764 = li775
      =>
      i764 = i775
    )
    &
    li764 /= lo752
    &
    (
      li764 = lo754
      =>
      i764 = o754
    )
    &
    li764 /= lo757
    &
    li764 /= lo760
    &
    (
      li764 = lo762
      =>
      i764 = o762
    )
    &
    li764 /= lo765
    &
    li764 /= lo768
    &
    (
      li764 = lo770
      =>
      i764 = o770
    )
    &
    li764 /= lo773
    &
    li764 /= lo776
    &
    (
      li764 = linput03set
      =>
      i764 = {p1,p2}
    )
    &
    (
      li764 = linput13set
      =>
      i764 = {}
    )
    &
    (
      li764 = linput23set
      =>
      i764 = {p3}
    )
    &
    li764 /= lovalue03boolean
    &
    (
      li766 = li767
      =>
      i766 = i767
    )
    &
    (
      li766 = li771
      =>
      i766 = i771
    )
    &
    (
      li766 = li772
      =>
      i766 = i772
    )
    &
    (
      li766 = li774
      =>
      i766 = i774
    )
    &
    (
      li766 = li775
      =>
      i766 = i775
    )
    &
    li766 /= lo752
    &
    (
      li766 = lo754
      =>
      i766 = o754
    )
    &
    li766 /= lo757
    &
    li766 /= lo760
    &
    (
      li766 = lo762
      =>
      i766 = o762
    )
    &
    li766 /= lo765
    &
    li766 /= lo768
    &
    (
      li766 = lo770
      =>
      i766 = o770
    )
    &
    li766 /= lo773
    &
    li766 /= lo776
    &
    (
      li766 = linput03set
      =>
      i766 = {p1,p2}
    )
    &
    (
      li766 = linput13set
      =>
      i766 = {}
    )
    &
    (
      li766 = linput23set
      =>
      i766 = {p3}
    )
    &
    li766 /= lovalue03boolean
    &
    (
      li767 = li771
      =>
      i767 = i771
    )
    &
    (
      li767 = li772
      =>
      i767 = i772
    )
    &
    (
      li767 = li774
      =>
      i767 = i774
    )
    &
    (
      li767 = li775
      =>
      i767 = i775
    )
    &
    li767 /= lo752
    &
    (
      li767 = lo754
      =>
      i767 = o754
    )
    &
    li767 /= lo757
    &
    li767 /= lo760
    &
    (
      li767 = lo762
      =>
      i767 = o762
    )
    &
    li767 /= lo765
    &
    li767 /= lo768
    &
    (
      li767 = lo770
      =>
      i767 = o770
    )
    &
    li767 /= lo773
    &
    li767 /= lo776
    &
    (
      li767 = linput03set
      =>
      i767 = {p1,p2}
    )
    &
    (
      li767 = linput13set
      =>
      i767 = {}
    )
    &
    (
      li767 = linput23set
      =>
      i767 = {p3}
    )
    &
    li767 /= lovalue03boolean
    &
    (
      li771 = li772
      =>
      i771 = i772
    )
    &
    (
      li771 = li774
      =>
      i771 = i774
    )
    &
    (
      li771 = li775
      =>
      i771 = i775
    )
    &
    li771 /= lo752
    &
    (
      li771 = lo754
      =>
      i771 = o754
    )
    &
    li771 /= lo757
    &
    li771 /= lo760
    &
    (
      li771 = lo762
      =>
      i771 = o762
    )
    &
    li771 /= lo765
    &
    li771 /= lo768
    &
    (
      li771 = lo770
      =>
      i771 = o770
    )
    &
    li771 /= lo773
    &
    li771 /= lo776
    &
    (
      li771 = linput03set
      =>
      i771 = {p1,p2}
    )
    &
    (
      li771 = linput13set
      =>
      i771 = {}
    )
    &
    (
      li771 = linput23set
      =>
      i771 = {p3}
    )
    &
    li771 /= lovalue03boolean
    &
    (
      li772 = li774
      =>
      i772 = i774
    )
    &
    (
      li772 = li775
      =>
      i772 = i775
    )
    &
    li772 /= lo752
    &
    (
      li772 = lo754
      =>
      i772 = o754
    )
    &
    li772 /= lo757
    &
    li772 /= lo760
    &
    (
      li772 = lo762
      =>
      i772 = o762
    )
    &
    li772 /= lo765
    &
    li772 /= lo768
    &
    (
      li772 = lo770
      =>
      i772 = o770
    )
    &
    li772 /= lo773
    &
    li772 /= lo776
    &
    (
      li772 = linput03set
      =>
      i772 = {p1,p2}
    )
    &
    (
      li772 = linput13set
      =>
      i772 = {}
    )
    &
    (
      li772 = linput23set
      =>
      i772 = {p3}
    )
    &
    li772 /= lovalue03boolean
    &
    (
      li774 = li775
      =>
      i774 = i775
    )
    &
    li774 /= lo752
    &
    (
      li774 = lo754
      =>
      i774 = o754
    )
    &
    li774 /= lo757
    &
    li774 /= lo760
    &
    (
      li774 = lo762
      =>
      i774 = o762
    )
    &
    li774 /= lo765
    &
    li774 /= lo768
    &
    (
      li774 = lo770
      =>
      i774 = o770
    )
    &
    li774 /= lo773
    &
    li774 /= lo776
    &
    (
      li774 = linput03set
      =>
      i774 = {p1,p2}
    )
    &
    (
      li774 = linput13set
      =>
      i774 = {}
    )
    &
    (
      li774 = linput23set
      =>
      i774 = {p3}
    )
    &
    li774 /= lovalue03boolean
    &
    li775 /= lo752
    &
    (
      li775 = lo754
      =>
      i775 = o754
    )
    &
    li775 /= lo757
    &
    li775 /= lo760
    &
    (
      li775 = lo762
      =>
      i775 = o762
    )
    &
    li775 /= lo765
    &
    li775 /= lo768
    &
    (
      li775 = lo770
      =>
      i775 = o770
    )
    &
    li775 /= lo773
    &
    li775 /= lo776
    &
    (
      li775 = linput03set
      =>
      i775 = {p1,p2}
    )
    &
    (
      li775 = linput13set
      =>
      i775 = {}
    )
    &
    (
      li775 = linput23set
      =>
      i775 = {p3}
    )
    &
    li775 /= lovalue03boolean
    &
    lo752 /= lo754
    &
    (
      lo752 = lo757
      =>
      o752 = o757
    )
    &
    (
      lo752 = lo760
      =>
      o752 = o760
    )
    &
    lo752 /= lo762
    &
    (
      lo752 = lo765
      =>
      o752 = o765
    )
    &
    (
      lo752 = lo768
      =>
      o752 = o768
    )
    &
    lo752 /= lo770
    &
    (
      lo752 = lo773
      =>
      o752 = o773
    )
    &
    (
      lo752 = lo776
      =>
      o752 = o776
    )
    &
    lo752 /= linput03set
    &
    lo752 /= linput13set
    &
    lo752 /= linput23set
    &
    (
      lo752 = lovalue03boolean
      =>
      o752 = TRUE
    )
    &
    lo754 /= lo757
    &
    lo754 /= lo760
    &
    (
      lo754 = lo762
      =>
      o754 = o762
    )
    &
    lo754 /= lo765
    &
    lo754 /= lo768
    &
    (
      lo754 = lo770
      =>
      o754 = o770
    )
    &
    lo754 /= lo773
    &
    lo754 /= lo776
    &
    (
      lo754 = linput03set
      =>
      o754 = {p1,p2}
    )
    &
    (
      lo754 = linput13set
      =>
      o754 = {}
    )
    &
    (
      lo754 = linput23set
      =>
      o754 = {p3}
    )
    &
    lo754 /= lovalue03boolean
    &
    (
      lo757 = lo760
      =>
      o757 = o760
    )
    &
    lo757 /= lo762
    &
    (
      lo757 = lo765
      =>
      o757 = o765
    )
    &
    (
      lo757 = lo768
      =>
      o757 = o768
    )
    &
    lo757 /= lo770
    &
    (
      lo757 = lo773
      =>
      o757 = o773
    )
    &
    (
      lo757 = lo776
      =>
      o757 = o776
    )
    &
    lo757 /= linput03set
    &
    lo757 /= linput13set
    &
    lo757 /= linput23set
    &
    (
      lo757 = lovalue03boolean
      =>
      o757 = TRUE
    )
    &
    lo760 /= lo762
    &
    (
      lo760 = lo765
      =>
      o760 = o765
    )
    &
    (
      lo760 = lo768
      =>
      o760 = o768
    )
    &
    lo760 /= lo770
    &
    (
      lo760 = lo773
      =>
      o760 = o773
    )
    &
    (
      lo760 = lo776
      =>
      o760 = o776
    )
    &
    lo760 /= linput03set
    &
    lo760 /= linput13set
    &
    lo760 /= linput23set
    &
    (
      lo760 = lovalue03boolean
      =>
      o760 = TRUE
    )
    &
    lo762 /= lo765
    &
    lo762 /= lo768
    &
    (
      lo762 = lo770
      =>
      o762 = o770
    )
    &
    lo762 /= lo773
    &
    lo762 /= lo776
    &
    (
      lo762 = linput03set
      =>
      o762 = {p1,p2}
    )
    &
    (
      lo762 = linput13set
      =>
      o762 = {}
    )
    &
    (
      lo762 = linput23set
      =>
      o762 = {p3}
    )
    &
    lo762 /= lovalue03boolean
    &
    (
      lo765 = lo768
      =>
      o765 = o768
    )
    &
    lo765 /= lo770
    &
    (
      lo765 = lo773
      =>
      o765 = o773
    )
    &
    (
      lo765 = lo776
      =>
      o765 = o776
    )
    &
    lo765 /= linput03set
    &
    lo765 /= linput13set
    &
    lo765 /= linput23set
    &
    (
      lo765 = lovalue03boolean
      =>
      o765 = TRUE
    )
    &
    lo768 /= lo770
    &
    (
      lo768 = lo773
      =>
      o768 = o773
    )
    &
    (
      lo768 = lo776
      =>
      o768 = o776
    )
    &
    lo768 /= linput03set
    &
    lo768 /= linput13set
    &
    lo768 /= linput23set
    &
    (
      lo768 = lovalue03boolean
      =>
      o768 = TRUE
    )
    &
    lo770 /= lo773
    &
    lo770 /= lo776
    &
    (
      lo770 = linput03set
      =>
      o770 = {p1,p2}
    )
    &
    (
      lo770 = linput13set
      =>
      o770 = {}
    )
    &
    (
      lo770 = linput23set
      =>
      o770 = {p3}
    )
    &
    lo770 /= lovalue03boolean
    &
    (
      lo773 = lo776
      =>
      o773 = o776
    )
    &
    lo773 /= linput03set
    &
    lo773 /= linput13set
    &
    lo773 /= linput23set
    &
    (
      lo773 = lovalue03boolean
      =>
      o773 = TRUE
    )
    &
    lo776 /= linput03set
    &
    lo776 /= linput13set
    &
    lo776 /= linput23set
    &
    (
      lo776 = lovalue03boolean
      =>
      o776 = TRUE
    )
    &
    (
      linput03set = linput13set
      =>
      {p1,p2} = {}
    )
    &
    (
      linput03set = linput23set
      =>
      {p1,p2} = {p3}
    )
    &
    linput03set /= lovalue03boolean
    &
    (
      linput13set = linput23set
      =>
      {} = {p3}
    )
    &
    linput13set /= lovalue03boolean
    &
    linput23set /= lovalue03boolean
    &
    card(i755) <= 5
    &
    card(i756) <= 5
    &
    card(i758) <= 5
    &
    card(i759) <= 5
    &
    card(i763) <= 5
    &
    card(i764) <= 5
    &
    card(i766) <= 5
    &
    card(i767) <= 5
    &
    card(i771) <= 5
    &
    card(i772) <= 5
    &
    card(i774) <= 5
    &
    card(i775) <= 5
    &
    card(o754) <= 5
    &
    card(o762) <= 5
    &
    card(o770) <= 5
  )
)
&
#(o776,o773,o770,o768,o765,o762,o760,o757,o754,o752,i775,i774,i772,i771,i767,i766,i764,i763,i759,i758,i756,i755,i751,i750,waiting,ready,active).(
  (
    waiting : POW(PID)
    &
    ready : POW(PID)
    &
    active : POW(PID)
    &
    active = {p2}
    &
    ready = {}
    &
    waiting = {p1,p3}
    &
    lovalue04boolean = 12
    &
    linput24set = 2
    &
    linput14set = 1
    &
    linput04set = 0
    &
    (
      (
        i750 = TRUE
        &
        i751 = TRUE
        &
        o752 = TRUE
      )
      or
      (
        (
          i750 = FALSE
          or
          i751 = FALSE
        )
        &
        o752 = FALSE
      )
    )
    &
    constant753 = o754
    &
    (
      i755 = i756
      <=>
      o757 = TRUE
    )
    &
    (
      i758 /= i759
      <=>
      o760 = TRUE
    )
    &
    constant761 = o762
    &
    (
      i763 = i764
      <=>
      o765 = TRUE
    )
    &
    (
      i766 /= i767
      <=>
      o768 = TRUE
    )
    &
    constant769 = o770
    &
    (
      i771 = i772
      <=>
      o773 = TRUE
    )
    &
    (
      i774 /= i775
      <=>
      o776 = TRUE
    )
    &
    li774 <= li775
    &
    li771 <= li772
    &
    li766 <= li767
    &
    li763 <= li764
    &
    li758 <= li759
    &
    li755 <= li756
    &
    li750 <= li751
    &
    (
      li750 = li751
      =>
      i750 = i751
    )
    &
    li750 /= li755
    &
    li750 /= li756
    &
    li750 /= li758
    &
    li750 /= li759
    &
    li750 /= li763
    &
    li750 /= li764
    &
    li750 /= li766
    &
    li750 /= li767
    &
    li750 /= li771
    &
    li750 /= li772
    &
    li750 /= li774
    &
    li750 /= li775
    &
    (
      li750 = lo752
      =>
      i750 = o752
    )
    &
    li750 /= lo754
    &
    (
      li750 = lo757
      =>
      i750 = o757
    )
    &
    (
      li750 = lo760
      =>
      i750 = o760
    )
    &
    li750 /= lo762
    &
    (
      li750 = lo765
      =>
      i750 = o765
    )
    &
    (
      li750 = lo768
      =>
      i750 = o768
    )
    &
    li750 /= lo770
    &
    (
      li750 = lo773
      =>
      i750 = o773
    )
    &
    (
      li750 = lo776
      =>
      i750 = o776
    )
    &
    li750 /= linput04set
    &
    li750 /= linput14set
    &
    li750 /= linput24set
    &
    (
      li750 = lovalue04boolean
      =>
      i750 = TRUE
    )
    &
    li751 /= li755
    &
    li751 /= li756
    &
    li751 /= li758
    &
    li751 /= li759
    &
    li751 /= li763
    &
    li751 /= li764
    &
    li751 /= li766
    &
    li751 /= li767
    &
    li751 /= li771
    &
    li751 /= li772
    &
    li751 /= li774
    &
    li751 /= li775
    &
    (
      li751 = lo752
      =>
      i751 = o752
    )
    &
    li751 /= lo754
    &
    (
      li751 = lo757
      =>
      i751 = o757
    )
    &
    (
      li751 = lo760
      =>
      i751 = o760
    )
    &
    li751 /= lo762
    &
    (
      li751 = lo765
      =>
      i751 = o765
    )
    &
    (
      li751 = lo768
      =>
      i751 = o768
    )
    &
    li751 /= lo770
    &
    (
      li751 = lo773
      =>
      i751 = o773
    )
    &
    (
      li751 = lo776
      =>
      i751 = o776
    )
    &
    li751 /= linput04set
    &
    li751 /= linput14set
    &
    li751 /= linput24set
    &
    (
      li751 = lovalue04boolean
      =>
      i751 = TRUE
    )
    &
    (
      li755 = li756
      =>
      i755 = i756
    )
    &
    (
      li755 = li758
      =>
      i755 = i758
    )
    &
    (
      li755 = li759
      =>
      i755 = i759
    )
    &
    (
      li755 = li763
      =>
      i755 = i763
    )
    &
    (
      li755 = li764
      =>
      i755 = i764
    )
    &
    (
      li755 = li766
      =>
      i755 = i766
    )
    &
    (
      li755 = li767
      =>
      i755 = i767
    )
    &
    (
      li755 = li771
      =>
      i755 = i771
    )
    &
    (
      li755 = li772
      =>
      i755 = i772
    )
    &
    (
      li755 = li774
      =>
      i755 = i774
    )
    &
    (
      li755 = li775
      =>
      i755 = i775
    )
    &
    li755 /= lo752
    &
    (
      li755 = lo754
      =>
      i755 = o754
    )
    &
    li755 /= lo757
    &
    li755 /= lo760
    &
    (
      li755 = lo762
      =>
      i755 = o762
    )
    &
    li755 /= lo765
    &
    li755 /= lo768
    &
    (
      li755 = lo770
      =>
      i755 = o770
    )
    &
    li755 /= lo773
    &
    li755 /= lo776
    &
    (
      li755 = linput04set
      =>
      i755 = {p1,p3}
    )
    &
    (
      li755 = linput14set
      =>
      i755 = {}
    )
    &
    (
      li755 = linput24set
      =>
      i755 = {p2}
    )
    &
    li755 /= lovalue04boolean
    &
    (
      li756 = li758
      =>
      i756 = i758
    )
    &
    (
      li756 = li759
      =>
      i756 = i759
    )
    &
    (
      li756 = li763
      =>
      i756 = i763
    )
    &
    (
      li756 = li764
      =>
      i756 = i764
    )
    &
    (
      li756 = li766
      =>
      i756 = i766
    )
    &
    (
      li756 = li767
      =>
      i756 = i767
    )
    &
    (
      li756 = li771
      =>
      i756 = i771
    )
    &
    (
      li756 = li772
      =>
      i756 = i772
    )
    &
    (
      li756 = li774
      =>
      i756 = i774
    )
    &
    (
      li756 = li775
      =>
      i756 = i775
    )
    &
    li756 /= lo752
    &
    (
      li756 = lo754
      =>
      i756 = o754
    )
    &
    li756 /= lo757
    &
    li756 /= lo760
    &
    (
      li756 = lo762
      =>
      i756 = o762
    )
    &
    li756 /= lo765
    &
    li756 /= lo768
    &
    (
      li756 = lo770
      =>
      i756 = o770
    )
    &
    li756 /= lo773
    &
    li756 /= lo776
    &
    (
      li756 = linput04set
      =>
      i756 = {p1,p3}
    )
    &
    (
      li756 = linput14set
      =>
      i756 = {}
    )
    &
    (
      li756 = linput24set
      =>
      i756 = {p2}
    )
    &
    li756 /= lovalue04boolean
    &
    (
      li758 = li759
      =>
      i758 = i759
    )
    &
    (
      li758 = li763
      =>
      i758 = i763
    )
    &
    (
      li758 = li764
      =>
      i758 = i764
    )
    &
    (
      li758 = li766
      =>
      i758 = i766
    )
    &
    (
      li758 = li767
      =>
      i758 = i767
    )
    &
    (
      li758 = li771
      =>
      i758 = i771
    )
    &
    (
      li758 = li772
      =>
      i758 = i772
    )
    &
    (
      li758 = li774
      =>
      i758 = i774
    )
    &
    (
      li758 = li775
      =>
      i758 = i775
    )
    &
    li758 /= lo752
    &
    (
      li758 = lo754
      =>
      i758 = o754
    )
    &
    li758 /= lo757
    &
    li758 /= lo760
    &
    (
      li758 = lo762
      =>
      i758 = o762
    )
    &
    li758 /= lo765
    &
    li758 /= lo768
    &
    (
      li758 = lo770
      =>
      i758 = o770
    )
    &
    li758 /= lo773
    &
    li758 /= lo776
    &
    (
      li758 = linput04set
      =>
      i758 = {p1,p3}
    )
    &
    (
      li758 = linput14set
      =>
      i758 = {}
    )
    &
    (
      li758 = linput24set
      =>
      i758 = {p2}
    )
    &
    li758 /= lovalue04boolean
    &
    (
      li759 = li763
      =>
      i759 = i763
    )
    &
    (
      li759 = li764
      =>
      i759 = i764
    )
    &
    (
      li759 = li766
      =>
      i759 = i766
    )
    &
    (
      li759 = li767
      =>
      i759 = i767
    )
    &
    (
      li759 = li771
      =>
      i759 = i771
    )
    &
    (
      li759 = li772
      =>
      i759 = i772
    )
    &
    (
      li759 = li774
      =>
      i759 = i774
    )
    &
    (
      li759 = li775
      =>
      i759 = i775
    )
    &
    li759 /= lo752
    &
    (
      li759 = lo754
      =>
      i759 = o754
    )
    &
    li759 /= lo757
    &
    li759 /= lo760
    &
    (
      li759 = lo762
      =>
      i759 = o762
    )
    &
    li759 /= lo765
    &
    li759 /= lo768
    &
    (
      li759 = lo770
      =>
      i759 = o770
    )
    &
    li759 /= lo773
    &
    li759 /= lo776
    &
    (
      li759 = linput04set
      =>
      i759 = {p1,p3}
    )
    &
    (
      li759 = linput14set
      =>
      i759 = {}
    )
    &
    (
      li759 = linput24set
      =>
      i759 = {p2}
    )
    &
    li759 /= lovalue04boolean
    &
    (
      li763 = li764
      =>
      i763 = i764
    )
    &
    (
      li763 = li766
      =>
      i763 = i766
    )
    &
    (
      li763 = li767
      =>
      i763 = i767
    )
    &
    (
      li763 = li771
      =>
      i763 = i771
    )
    &
    (
      li763 = li772
      =>
      i763 = i772
    )
    &
    (
      li763 = li774
      =>
      i763 = i774
    )
    &
    (
      li763 = li775
      =>
      i763 = i775
    )
    &
    li763 /= lo752
    &
    (
      li763 = lo754
      =>
      i763 = o754
    )
    &
    li763 /= lo757
    &
    li763 /= lo760
    &
    (
      li763 = lo762
      =>
      i763 = o762
    )
    &
    li763 /= lo765
    &
    li763 /= lo768
    &
    (
      li763 = lo770
      =>
      i763 = o770
    )
    &
    li763 /= lo773
    &
    li763 /= lo776
    &
    (
      li763 = linput04set
      =>
      i763 = {p1,p3}
    )
    &
    (
      li763 = linput14set
      =>
      i763 = {}
    )
    &
    (
      li763 = linput24set
      =>
      i763 = {p2}
    )
    &
    li763 /= lovalue04boolean
    &
    (
      li764 = li766
      =>
      i764 = i766
    )
    &
    (
      li764 = li767
      =>
      i764 = i767
    )
    &
    (
      li764 = li771
      =>
      i764 = i771
    )
    &
    (
      li764 = li772
      =>
      i764 = i772
    )
    &
    (
      li764 = li774
      =>
      i764 = i774
    )
    &
    (
      li764 = li775
      =>
      i764 = i775
    )
    &
    li764 /= lo752
    &
    (
      li764 = lo754
      =>
      i764 = o754
    )
    &
    li764 /= lo757
    &
    li764 /= lo760
    &
    (
      li764 = lo762
      =>
      i764 = o762
    )
    &
    li764 /= lo765
    &
    li764 /= lo768
    &
    (
      li764 = lo770
      =>
      i764 = o770
    )
    &
    li764 /= lo773
    &
    li764 /= lo776
    &
    (
      li764 = linput04set
      =>
      i764 = {p1,p3}
    )
    &
    (
      li764 = linput14set
      =>
      i764 = {}
    )
    &
    (
      li764 = linput24set
      =>
      i764 = {p2}
    )
    &
    li764 /= lovalue04boolean
    &
    (
      li766 = li767
      =>
      i766 = i767
    )
    &
    (
      li766 = li771
      =>
      i766 = i771
    )
    &
    (
      li766 = li772
      =>
      i766 = i772
    )
    &
    (
      li766 = li774
      =>
      i766 = i774
    )
    &
    (
      li766 = li775
      =>
      i766 = i775
    )
    &
    li766 /= lo752
    &
    (
      li766 = lo754
      =>
      i766 = o754
    )
    &
    li766 /= lo757
    &
    li766 /= lo760
    &
    (
      li766 = lo762
      =>
      i766 = o762
    )
    &
    li766 /= lo765
    &
    li766 /= lo768
    &
    (
      li766 = lo770
      =>
      i766 = o770
    )
    &
    li766 /= lo773
    &
    li766 /= lo776
    &
    (
      li766 = linput04set
      =>
      i766 = {p1,p3}
    )
    &
    (
      li766 = linput14set
      =>
      i766 = {}
    )
    &
    (
      li766 = linput24set
      =>
      i766 = {p2}
    )
    &
    li766 /= lovalue04boolean
    &
    (
      li767 = li771
      =>
      i767 = i771
    )
    &
    (
      li767 = li772
      =>
      i767 = i772
    )
    &
    (
      li767 = li774
      =>
      i767 = i774
    )
    &
    (
      li767 = li775
      =>
      i767 = i775
    )
    &
    li767 /= lo752
    &
    (
      li767 = lo754
      =>
      i767 = o754
    )
    &
    li767 /= lo757
    &
    li767 /= lo760
    &
    (
      li767 = lo762
      =>
      i767 = o762
    )
    &
    li767 /= lo765
    &
    li767 /= lo768
    &
    (
      li767 = lo770
      =>
      i767 = o770
    )
    &
    li767 /= lo773
    &
    li767 /= lo776
    &
    (
      li767 = linput04set
      =>
      i767 = {p1,p3}
    )
    &
    (
      li767 = linput14set
      =>
      i767 = {}
    )
    &
    (
      li767 = linput24set
      =>
      i767 = {p2}
    )
    &
    li767 /= lovalue04boolean
    &
    (
      li771 = li772
      =>
      i771 = i772
    )
    &
    (
      li771 = li774
      =>
      i771 = i774
    )
    &
    (
      li771 = li775
      =>
      i771 = i775
    )
    &
    li771 /= lo752
    &
    (
      li771 = lo754
      =>
      i771 = o754
    )
    &
    li771 /= lo757
    &
    li771 /= lo760
    &
    (
      li771 = lo762
      =>
      i771 = o762
    )
    &
    li771 /= lo765
    &
    li771 /= lo768
    &
    (
      li771 = lo770
      =>
      i771 = o770
    )
    &
    li771 /= lo773
    &
    li771 /= lo776
    &
    (
      li771 = linput04set
      =>
      i771 = {p1,p3}
    )
    &
    (
      li771 = linput14set
      =>
      i771 = {}
    )
    &
    (
      li771 = linput24set
      =>
      i771 = {p2}
    )
    &
    li771 /= lovalue04boolean
    &
    (
      li772 = li774
      =>
      i772 = i774
    )
    &
    (
      li772 = li775
      =>
      i772 = i775
    )
    &
    li772 /= lo752
    &
    (
      li772 = lo754
      =>
      i772 = o754
    )
    &
    li772 /= lo757
    &
    li772 /= lo760
    &
    (
      li772 = lo762
      =>
      i772 = o762
    )
    &
    li772 /= lo765
    &
    li772 /= lo768
    &
    (
      li772 = lo770
      =>
      i772 = o770
    )
    &
    li772 /= lo773
    &
    li772 /= lo776
    &
    (
      li772 = linput04set
      =>
      i772 = {p1,p3}
    )
    &
    (
      li772 = linput14set
      =>
      i772 = {}
    )
    &
    (
      li772 = linput24set
      =>
      i772 = {p2}
    )
    &
    li772 /= lovalue04boolean
    &
    (
      li774 = li775
      =>
      i774 = i775
    )
    &
    li774 /= lo752
    &
    (
      li774 = lo754
      =>
      i774 = o754
    )
    &
    li774 /= lo757
    &
    li774 /= lo760
    &
    (
      li774 = lo762
      =>
      i774 = o762
    )
    &
    li774 /= lo765
    &
    li774 /= lo768
    &
    (
      li774 = lo770
      =>
      i774 = o770
    )
    &
    li774 /= lo773
    &
    li774 /= lo776
    &
    (
      li774 = linput04set
      =>
      i774 = {p1,p3}
    )
    &
    (
      li774 = linput14set
      =>
      i774 = {}
    )
    &
    (
      li774 = linput24set
      =>
      i774 = {p2}
    )
    &
    li774 /= lovalue04boolean
    &
    li775 /= lo752
    &
    (
      li775 = lo754
      =>
      i775 = o754
    )
    &
    li775 /= lo757
    &
    li775 /= lo760
    &
    (
      li775 = lo762
      =>
      i775 = o762
    )
    &
    li775 /= lo765
    &
    li775 /= lo768
    &
    (
      li775 = lo770
      =>
      i775 = o770
    )
    &
    li775 /= lo773
    &
    li775 /= lo776
    &
    (
      li775 = linput04set
      =>
      i775 = {p1,p3}
    )
    &
    (
      li775 = linput14set
      =>
      i775 = {}
    )
    &
    (
      li775 = linput24set
      =>
      i775 = {p2}
    )
    &
    li775 /= lovalue04boolean
    &
    lo752 /= lo754
    &
    (
      lo752 = lo757
      =>
      o752 = o757
    )
    &
    (
      lo752 = lo760
      =>
      o752 = o760
    )
    &
    lo752 /= lo762
    &
    (
      lo752 = lo765
      =>
      o752 = o765
    )
    &
    (
      lo752 = lo768
      =>
      o752 = o768
    )
    &
    lo752 /= lo770
    &
    (
      lo752 = lo773
      =>
      o752 = o773
    )
    &
    (
      lo752 = lo776
      =>
      o752 = o776
    )
    &
    lo752 /= linput04set
    &
    lo752 /= linput14set
    &
    lo752 /= linput24set
    &
    (
      lo752 = lovalue04boolean
      =>
      o752 = TRUE
    )
    &
    lo754 /= lo757
    &
    lo754 /= lo760
    &
    (
      lo754 = lo762
      =>
      o754 = o762
    )
    &
    lo754 /= lo765
    &
    lo754 /= lo768
    &
    (
      lo754 = lo770
      =>
      o754 = o770
    )
    &
    lo754 /= lo773
    &
    lo754 /= lo776
    &
    (
      lo754 = linput04set
      =>
      o754 = {p1,p3}
    )
    &
    (
      lo754 = linput14set
      =>
      o754 = {}
    )
    &
    (
      lo754 = linput24set
      =>
      o754 = {p2}
    )
    &
    lo754 /= lovalue04boolean
    &
    (
      lo757 = lo760
      =>
      o757 = o760
    )
    &
    lo757 /= lo762
    &
    (
      lo757 = lo765
      =>
      o757 = o765
    )
    &
    (
      lo757 = lo768
      =>
      o757 = o768
    )
    &
    lo757 /= lo770
    &
    (
      lo757 = lo773
      =>
      o757 = o773
    )
    &
    (
      lo757 = lo776
      =>
      o757 = o776
    )
    &
    lo757 /= linput04set
    &
    lo757 /= linput14set
    &
    lo757 /= linput24set
    &
    (
      lo757 = lovalue04boolean
      =>
      o757 = TRUE
    )
    &
    lo760 /= lo762
    &
    (
      lo760 = lo765
      =>
      o760 = o765
    )
    &
    (
      lo760 = lo768
      =>
      o760 = o768
    )
    &
    lo760 /= lo770
    &
    (
      lo760 = lo773
      =>
      o760 = o773
    )
    &
    (
      lo760 = lo776
      =>
      o760 = o776
    )
    &
    lo760 /= linput04set
    &
    lo760 /= linput14set
    &
    lo760 /= linput24set
    &
    (
      lo760 = lovalue04boolean
      =>
      o760 = TRUE
    )
    &
    lo762 /= lo765
    &
    lo762 /= lo768
    &
    (
      lo762 = lo770
      =>
      o762 = o770
    )
    &
    lo762 /= lo773
    &
    lo762 /= lo776
    &
    (
      lo762 = linput04set
      =>
      o762 = {p1,p3}
    )
    &
    (
      lo762 = linput14set
      =>
      o762 = {}
    )
    &
    (
      lo762 = linput24set
      =>
      o762 = {p2}
    )
    &
    lo762 /= lovalue04boolean
    &
    (
      lo765 = lo768
      =>
      o765 = o768
    )
    &
    lo765 /= lo770
    &
    (
      lo765 = lo773
      =>
      o765 = o773
    )
    &
    (
      lo765 = lo776
      =>
      o765 = o776
    )
    &
    lo765 /= linput04set
    &
    lo765 /= linput14set
    &
    lo765 /= linput24set
    &
    (
      lo765 = lovalue04boolean
      =>
      o765 = TRUE
    )
    &
    lo768 /= lo770
    &
    (
      lo768 = lo773
      =>
      o768 = o773
    )
    &
    (
      lo768 = lo776
      =>
      o768 = o776
    )
    &
    lo768 /= linput04set
    &
    lo768 /= linput14set
    &
    lo768 /= linput24set
    &
    (
      lo768 = lovalue04boolean
      =>
      o768 = TRUE
    )
    &
    lo770 /= lo773
    &
    lo770 /= lo776
    &
    (
      lo770 = linput04set
      =>
      o770 = {p1,p3}
    )
    &
    (
      lo770 = linput14set
      =>
      o770 = {}
    )
    &
    (
      lo770 = linput24set
      =>
      o770 = {p2}
    )
    &
    lo770 /= lovalue04boolean
    &
    (
      lo773 = lo776
      =>
      o773 = o776
    )
    &
    lo773 /= linput04set
    &
    lo773 /= linput14set
    &
    lo773 /= linput24set
    &
    (
      lo773 = lovalue04boolean
      =>
      o773 = TRUE
    )
    &
    lo776 /= linput04set
    &
    lo776 /= linput14set
    &
    lo776 /= linput24set
    &
    (
      lo776 = lovalue04boolean
      =>
      o776 = TRUE
    )
    &
    (
      linput04set = linput14set
      =>
      {p1,p3} = {}
    )
    &
    (
      linput04set = linput24set
      =>
      {p1,p3} = {p2}
    )
    &
    linput04set /= lovalue04boolean
    &
    (
      linput14set = linput24set
      =>
      {} = {p2}
    )
    &
    linput14set /= lovalue04boolean
    &
    linput24set /= lovalue04boolean
    &
    card(i755) <= 5
    &
    card(i756) <= 5
    &
    card(i758) <= 5
    &
    card(i759) <= 5
    &
    card(i763) <= 5
    &
    card(i764) <= 5
    &
    card(i766) <= 5
    &
    card(i767) <= 5
    &
    card(i771) <= 5
    &
    card(i772) <= 5
    &
    card(i774) <= 5
    &
    card(i775) <= 5
    &
    card(o754) <= 5
    &
    card(o762) <= 5
    &
    card(o770) <= 5
  )
)
&
#(o776,o773,o770,o768,o765,o762,o760,o757,o754,o752,i775,i774,i772,i771,i767,i766,i764,i763,i759,i758,i756,i755,i751,i750,waiting,ready,active).(
  (
    waiting : POW(PID)
    &
    ready : POW(PID)
    &
    active : POW(PID)
    &
    active = {p1}
    &
    ready = {p2,p3}
    &
    waiting = {}
    &
    lovalue07boolean = 12
    &
    linput27set = 2
    &
    linput17set = 1
    &
    linput07set = 0
    &
    (
      (
        i750 = TRUE
        &
        i751 = TRUE
        &
        o752 = TRUE
      )
      or
      (
        (
          i750 = FALSE
          or
          i751 = FALSE
        )
        &
        o752 = FALSE
      )
    )
    &
    constant753 = o754
    &
    (
      i755 = i756
      <=>
      o757 = TRUE
    )
    &
    (
      i758 /= i759
      <=>
      o760 = TRUE
    )
    &
    constant761 = o762
    &
    (
      i763 = i764
      <=>
      o765 = TRUE
    )
    &
    (
      i766 /= i767
      <=>
      o768 = TRUE
    )
    &
    constant769 = o770
    &
    (
      i771 = i772
      <=>
      o773 = TRUE
    )
    &
    (
      i774 /= i775
      <=>
      o776 = TRUE
    )
    &
    li774 <= li775
    &
    li771 <= li772
    &
    li766 <= li767
    &
    li763 <= li764
    &
    li758 <= li759
    &
    li755 <= li756
    &
    li750 <= li751
    &
    (
      li750 = li751
      =>
      i750 = i751
    )
    &
    li750 /= li755
    &
    li750 /= li756
    &
    li750 /= li758
    &
    li750 /= li759
    &
    li750 /= li763
    &
    li750 /= li764
    &
    li750 /= li766
    &
    li750 /= li767
    &
    li750 /= li771
    &
    li750 /= li772
    &
    li750 /= li774
    &
    li750 /= li775
    &
    (
      li750 = lo752
      =>
      i750 = o752
    )
    &
    li750 /= lo754
    &
    (
      li750 = lo757
      =>
      i750 = o757
    )
    &
    (
      li750 = lo760
      =>
      i750 = o760
    )
    &
    li750 /= lo762
    &
    (
      li750 = lo765
      =>
      i750 = o765
    )
    &
    (
      li750 = lo768
      =>
      i750 = o768
    )
    &
    li750 /= lo770
    &
    (
      li750 = lo773
      =>
      i750 = o773
    )
    &
    (
      li750 = lo776
      =>
      i750 = o776
    )
    &
    li750 /= linput07set
    &
    li750 /= linput17set
    &
    li750 /= linput27set
    &
    (
      li750 = lovalue07boolean
      =>
      i750 = FALSE
    )
    &
    li751 /= li755
    &
    li751 /= li756
    &
    li751 /= li758
    &
    li751 /= li759
    &
    li751 /= li763
    &
    li751 /= li764
    &
    li751 /= li766
    &
    li751 /= li767
    &
    li751 /= li771
    &
    li751 /= li772
    &
    li751 /= li774
    &
    li751 /= li775
    &
    (
      li751 = lo752
      =>
      i751 = o752
    )
    &
    li751 /= lo754
    &
    (
      li751 = lo757
      =>
      i751 = o757
    )
    &
    (
      li751 = lo760
      =>
      i751 = o760
    )
    &
    li751 /= lo762
    &
    (
      li751 = lo765
      =>
      i751 = o765
    )
    &
    (
      li751 = lo768
      =>
      i751 = o768
    )
    &
    li751 /= lo770
    &
    (
      li751 = lo773
      =>
      i751 = o773
    )
    &
    (
      li751 = lo776
      =>
      i751 = o776
    )
    &
    li751 /= linput07set
    &
    li751 /= linput17set
    &
    li751 /= linput27set
    &
    (
      li751 = lovalue07boolean
      =>
      i751 = FALSE
    )
    &
    (
      li755 = li756
      =>
      i755 = i756
    )
    &
    (
      li755 = li758
      =>
      i755 = i758
    )
    &
    (
      li755 = li759
      =>
      i755 = i759
    )
    &
    (
      li755 = li763
      =>
      i755 = i763
    )
    &
    (
      li755 = li764
      =>
      i755 = i764
    )
    &
    (
      li755 = li766
      =>
      i755 = i766
    )
    &
    (
      li755 = li767
      =>
      i755 = i767
    )
    &
    (
      li755 = li771
      =>
      i755 = i771
    )
    &
    (
      li755 = li772
      =>
      i755 = i772
    )
    &
    (
      li755 = li774
      =>
      i755 = i774
    )
    &
    (
      li755 = li775
      =>
      i755 = i775
    )
    &
    li755 /= lo752
    &
    (
      li755 = lo754
      =>
      i755 = o754
    )
    &
    li755 /= lo757
    &
    li755 /= lo760
    &
    (
      li755 = lo762
      =>
      i755 = o762
    )
    &
    li755 /= lo765
    &
    li755 /= lo768
    &
    (
      li755 = lo770
      =>
      i755 = o770
    )
    &
    li755 /= lo773
    &
    li755 /= lo776
    &
    (
      li755 = linput07set
      =>
      i755 = {}
    )
    &
    (
      li755 = linput17set
      =>
      i755 = {p2,p3}
    )
    &
    (
      li755 = linput27set
      =>
      i755 = {p1}
    )
    &
    li755 /= lovalue07boolean
    &
    (
      li756 = li758
      =>
      i756 = i758
    )
    &
    (
      li756 = li759
      =>
      i756 = i759
    )
    &
    (
      li756 = li763
      =>
      i756 = i763
    )
    &
    (
      li756 = li764
      =>
      i756 = i764
    )
    &
    (
      li756 = li766
      =>
      i756 = i766
    )
    &
    (
      li756 = li767
      =>
      i756 = i767
    )
    &
    (
      li756 = li771
      =>
      i756 = i771
    )
    &
    (
      li756 = li772
      =>
      i756 = i772
    )
    &
    (
      li756 = li774
      =>
      i756 = i774
    )
    &
    (
      li756 = li775
      =>
      i756 = i775
    )
    &
    li756 /= lo752
    &
    (
      li756 = lo754
      =>
      i756 = o754
    )
    &
    li756 /= lo757
    &
    li756 /= lo760
    &
    (
      li756 = lo762
      =>
      i756 = o762
    )
    &
    li756 /= lo765
    &
    li756 /= lo768
    &
    (
      li756 = lo770
      =>
      i756 = o770
    )
    &
    li756 /= lo773
    &
    li756 /= lo776
    &
    (
      li756 = linput07set
      =>
      i756 = {}
    )
    &
    (
      li756 = linput17set
      =>
      i756 = {p2,p3}
    )
    &
    (
      li756 = linput27set
      =>
      i756 = {p1}
    )
    &
    li756 /= lovalue07boolean
    &
    (
      li758 = li759
      =>
      i758 = i759
    )
    &
    (
      li758 = li763
      =>
      i758 = i763
    )
    &
    (
      li758 = li764
      =>
      i758 = i764
    )
    &
    (
      li758 = li766
      =>
      i758 = i766
    )
    &
    (
      li758 = li767
      =>
      i758 = i767
    )
    &
    (
      li758 = li771
      =>
      i758 = i771
    )
    &
    (
      li758 = li772
      =>
      i758 = i772
    )
    &
    (
      li758 = li774
      =>
      i758 = i774
    )
    &
    (
      li758 = li775
      =>
      i758 = i775
    )
    &
    li758 /= lo752
    &
    (
      li758 = lo754
      =>
      i758 = o754
    )
    &
    li758 /= lo757
    &
    li758 /= lo760
    &
    (
      li758 = lo762
      =>
      i758 = o762
    )
    &
    li758 /= lo765
    &
    li758 /= lo768
    &
    (
      li758 = lo770
      =>
      i758 = o770
    )
    &
    li758 /= lo773
    &
    li758 /= lo776
    &
    (
      li758 = linput07set
      =>
      i758 = {}
    )
    &
    (
      li758 = linput17set
      =>
      i758 = {p2,p3}
    )
    &
    (
      li758 = linput27set
      =>
      i758 = {p1}
    )
    &
    li758 /= lovalue07boolean
    &
    (
      li759 = li763
      =>
      i759 = i763
    )
    &
    (
      li759 = li764
      =>
      i759 = i764
    )
    &
    (
      li759 = li766
      =>
      i759 = i766
    )
    &
    (
      li759 = li767
      =>
      i759 = i767
    )
    &
    (
      li759 = li771
      =>
      i759 = i771
    )
    &
    (
      li759 = li772
      =>
      i759 = i772
    )
    &
    (
      li759 = li774
      =>
      i759 = i774
    )
    &
    (
      li759 = li775
      =>
      i759 = i775
    )
    &
    li759 /= lo752
    &
    (
      li759 = lo754
      =>
      i759 = o754
    )
    &
    li759 /= lo757
    &
    li759 /= lo760
    &
    (
      li759 = lo762
      =>
      i759 = o762
    )
    &
    li759 /= lo765
    &
    li759 /= lo768
    &
    (
      li759 = lo770
      =>
      i759 = o770
    )
    &
    li759 /= lo773
    &
    li759 /= lo776
    &
    (
      li759 = linput07set
      =>
      i759 = {}
    )
    &
    (
      li759 = linput17set
      =>
      i759 = {p2,p3}
    )
    &
    (
      li759 = linput27set
      =>
      i759 = {p1}
    )
    &
    li759 /= lovalue07boolean
    &
    (
      li763 = li764
      =>
      i763 = i764
    )
    &
    (
      li763 = li766
      =>
      i763 = i766
    )
    &
    (
      li763 = li767
      =>
      i763 = i767
    )
    &
    (
      li763 = li771
      =>
      i763 = i771
    )
    &
    (
      li763 = li772
      =>
      i763 = i772
    )
    &
    (
      li763 = li774
      =>
      i763 = i774
    )
    &
    (
      li763 = li775
      =>
      i763 = i775
    )
    &
    li763 /= lo752
    &
    (
      li763 = lo754
      =>
      i763 = o754
    )
    &
    li763 /= lo757
    &
    li763 /= lo760
    &
    (
      li763 = lo762
      =>
      i763 = o762
    )
    &
    li763 /= lo765
    &
    li763 /= lo768
    &
    (
      li763 = lo770
      =>
      i763 = o770
    )
    &
    li763 /= lo773
    &
    li763 /= lo776
    &
    (
      li763 = linput07set
      =>
      i763 = {}
    )
    &
    (
      li763 = linput17set
      =>
      i763 = {p2,p3}
    )
    &
    (
      li763 = linput27set
      =>
      i763 = {p1}
    )
    &
    li763 /= lovalue07boolean
    &
    (
      li764 = li766
      =>
      i764 = i766
    )
    &
    (
      li764 = li767
      =>
      i764 = i767
    )
    &
    (
      li764 = li771
      =>
      i764 = i771
    )
    &
    (
      li764 = li772
      =>
      i764 = i772
    )
    &
    (
      li764 = li774
      =>
      i764 = i774
    )
    &
    (
      li764 = li775
      =>
      i764 = i775
    )
    &
    li764 /= lo752
    &
    (
      li764 = lo754
      =>
      i764 = o754
    )
    &
    li764 /= lo757
    &
    li764 /= lo760
    &
    (
      li764 = lo762
      =>
      i764 = o762
    )
    &
    li764 /= lo765
    &
    li764 /= lo768
    &
    (
      li764 = lo770
      =>
      i764 = o770
    )
    &
    li764 /= lo773
    &
    li764 /= lo776
    &
    (
      li764 = linput07set
      =>
      i764 = {}
    )
    &
    (
      li764 = linput17set
      =>
      i764 = {p2,p3}
    )
    &
    (
      li764 = linput27set
      =>
      i764 = {p1}
    )
    &
    li764 /= lovalue07boolean
    &
    (
      li766 = li767
      =>
      i766 = i767
    )
    &
    (
      li766 = li771
      =>
      i766 = i771
    )
    &
    (
      li766 = li772
      =>
      i766 = i772
    )
    &
    (
      li766 = li774
      =>
      i766 = i774
    )
    &
    (
      li766 = li775
      =>
      i766 = i775
    )
    &
    li766 /= lo752
    &
    (
      li766 = lo754
      =>
      i766 = o754
    )
    &
    li766 /= lo757
    &
    li766 /= lo760
    &
    (
      li766 = lo762
      =>
      i766 = o762
    )
    &
    li766 /= lo765
    &
    li766 /= lo768
    &
    (
      li766 = lo770
      =>
      i766 = o770
    )
    &
    li766 /= lo773
    &
    li766 /= lo776
    &
    (
      li766 = linput07set
      =>
      i766 = {}
    )
    &
    (
      li766 = linput17set
      =>
      i766 = {p2,p3}
    )
    &
    (
      li766 = linput27set
      =>
      i766 = {p1}
    )
    &
    li766 /= lovalue07boolean
    &
    (
      li767 = li771
      =>
      i767 = i771
    )
    &
    (
      li767 = li772
      =>
      i767 = i772
    )
    &
    (
      li767 = li774
      =>
      i767 = i774
    )
    &
    (
      li767 = li775
      =>
      i767 = i775
    )
    &
    li767 /= lo752
    &
    (
      li767 = lo754
      =>
      i767 = o754
    )
    &
    li767 /= lo757
    &
    li767 /= lo760
    &
    (
      li767 = lo762
      =>
      i767 = o762
    )
    &
    li767 /= lo765
    &
    li767 /= lo768
    &
    (
      li767 = lo770
      =>
      i767 = o770
    )
    &
    li767 /= lo773
    &
    li767 /= lo776
    &
    (
      li767 = linput07set
      =>
      i767 = {}
    )
    &
    (
      li767 = linput17set
      =>
      i767 = {p2,p3}
    )
    &
    (
      li767 = linput27set
      =>
      i767 = {p1}
    )
    &
    li767 /= lovalue07boolean
    &
    (
      li771 = li772
      =>
      i771 = i772
    )
    &
    (
      li771 = li774
      =>
      i771 = i774
    )
    &
    (
      li771 = li775
      =>
      i771 = i775
    )
    &
    li771 /= lo752
    &
    (
      li771 = lo754
      =>
      i771 = o754
    )
    &
    li771 /= lo757
    &
    li771 /= lo760
    &
    (
      li771 = lo762
      =>
      i771 = o762
    )
    &
    li771 /= lo765
    &
    li771 /= lo768
    &
    (
      li771 = lo770
      =>
      i771 = o770
    )
    &
    li771 /= lo773
    &
    li771 /= lo776
    &
    (
      li771 = linput07set
      =>
      i771 = {}
    )
    &
    (
      li771 = linput17set
      =>
      i771 = {p2,p3}
    )
    &
    (
      li771 = linput27set
      =>
      i771 = {p1}
    )
    &
    li771 /= lovalue07boolean
    &
    (
      li772 = li774
      =>
      i772 = i774
    )
    &
    (
      li772 = li775
      =>
      i772 = i775
    )
    &
    li772 /= lo752
    &
    (
      li772 = lo754
      =>
      i772 = o754
    )
    &
    li772 /= lo757
    &
    li772 /= lo760
    &
    (
      li772 = lo762
      =>
      i772 = o762
    )
    &
    li772 /= lo765
    &
    li772 /= lo768
    &
    (
      li772 = lo770
      =>
      i772 = o770
    )
    &
    li772 /= lo773
    &
    li772 /= lo776
    &
    (
      li772 = linput07set
      =>
      i772 = {}
    )
    &
    (
      li772 = linput17set
      =>
      i772 = {p2,p3}
    )
    &
    (
      li772 = linput27set
      =>
      i772 = {p1}
    )
    &
    li772 /= lovalue07boolean
    &
    (
      li774 = li775
      =>
      i774 = i775
    )
    &
    li774 /= lo752
    &
    (
      li774 = lo754
      =>
      i774 = o754
    )
    &
    li774 /= lo757
    &
    li774 /= lo760
    &
    (
      li774 = lo762
      =>
      i774 = o762
    )
    &
    li774 /= lo765
    &
    li774 /= lo768
    &
    (
      li774 = lo770
      =>
      i774 = o770
    )
    &
    li774 /= lo773
    &
    li774 /= lo776
    &
    (
      li774 = linput07set
      =>
      i774 = {}
    )
    &
    (
      li774 = linput17set
      =>
      i774 = {p2,p3}
    )
    &
    (
      li774 = linput27set
      =>
      i774 = {p1}
    )
    &
    li774 /= lovalue07boolean
    &
    li775 /= lo752
    &
    (
      li775 = lo754
      =>
      i775 = o754
    )
    &
    li775 /= lo757
    &
    li775 /= lo760
    &
    (
      li775 = lo762
      =>
      i775 = o762
    )
    &
    li775 /= lo765
    &
    li775 /= lo768
    &
    (
      li775 = lo770
      =>
      i775 = o770
    )
    &
    li775 /= lo773
    &
    li775 /= lo776
    &
    (
      li775 = linput07set
      =>
      i775 = {}
    )
    &
    (
      li775 = linput17set
      =>
      i775 = {p2,p3}
    )
    &
    (
      li775 = linput27set
      =>
      i775 = {p1}
    )
    &
    li775 /= lovalue07boolean
    &
    lo752 /= lo754
    &
    (
      lo752 = lo757
      =>
      o752 = o757
    )
    &
    (
      lo752 = lo760
      =>
      o752 = o760
    )
    &
    lo752 /= lo762
    &
    (
      lo752 = lo765
      =>
      o752 = o765
    )
    &
    (
      lo752 = lo768
      =>
      o752 = o768
    )
    &
    lo752 /= lo770
    &
    (
      lo752 = lo773
      =>
      o752 = o773
    )
    &
    (
      lo752 = lo776
      =>
      o752 = o776
    )
    &
    lo752 /= linput07set
    &
    lo752 /= linput17set
    &
    lo752 /= linput27set
    &
    (
      lo752 = lovalue07boolean
      =>
      o752 = FALSE
    )
    &
    lo754 /= lo757
    &
    lo754 /= lo760
    &
    (
      lo754 = lo762
      =>
      o754 = o762
    )
    &
    lo754 /= lo765
    &
    lo754 /= lo768
    &
    (
      lo754 = lo770
      =>
      o754 = o770
    )
    &
    lo754 /= lo773
    &
    lo754 /= lo776
    &
    (
      lo754 = linput07set
      =>
      o754 = {}
    )
    &
    (
      lo754 = linput17set
      =>
      o754 = {p2,p3}
    )
    &
    (
      lo754 = linput27set
      =>
      o754 = {p1}
    )
    &
    lo754 /= lovalue07boolean
    &
    (
      lo757 = lo760
      =>
      o757 = o760
    )
    &
    lo757 /= lo762
    &
    (
      lo757 = lo765
      =>
      o757 = o765
    )
    &
    (
      lo757 = lo768
      =>
      o757 = o768
    )
    &
    lo757 /= lo770
    &
    (
      lo757 = lo773
      =>
      o757 = o773
    )
    &
    (
      lo757 = lo776
      =>
      o757 = o776
    )
    &
    lo757 /= linput07set
    &
    lo757 /= linput17set
    &
    lo757 /= linput27set
    &
    (
      lo757 = lovalue07boolean
      =>
      o757 = FALSE
    )
    &
    lo760 /= lo762
    &
    (
      lo760 = lo765
      =>
      o760 = o765
    )
    &
    (
      lo760 = lo768
      =>
      o760 = o768
    )
    &
    lo760 /= lo770
    &
    (
      lo760 = lo773
      =>
      o760 = o773
    )
    &
    (
      lo760 = lo776
      =>
      o760 = o776
    )
    &
    lo760 /= linput07set
    &
    lo760 /= linput17set
    &
    lo760 /= linput27set
    &
    (
      lo760 = lovalue07boolean
      =>
      o760 = FALSE
    )
    &
    lo762 /= lo765
    &
    lo762 /= lo768
    &
    (
      lo762 = lo770
      =>
      o762 = o770
    )
    &
    lo762 /= lo773
    &
    lo762 /= lo776
    &
    (
      lo762 = linput07set
      =>
      o762 = {}
    )
    &
    (
      lo762 = linput17set
      =>
      o762 = {p2,p3}
    )
    &
    (
      lo762 = linput27set
      =>
      o762 = {p1}
    )
    &
    lo762 /= lovalue07boolean
    &
    (
      lo765 = lo768
      =>
      o765 = o768
    )
    &
    lo765 /= lo770
    &
    (
      lo765 = lo773
      =>
      o765 = o773
    )
    &
    (
      lo765 = lo776
      =>
      o765 = o776
    )
    &
    lo765 /= linput07set
    &
    lo765 /= linput17set
    &
    lo765 /= linput27set
    &
    (
      lo765 = lovalue07boolean
      =>
      o765 = FALSE
    )
    &
    lo768 /= lo770
    &
    (
      lo768 = lo773
      =>
      o768 = o773
    )
    &
    (
      lo768 = lo776
      =>
      o768 = o776
    )
    &
    lo768 /= linput07set
    &
    lo768 /= linput17set
    &
    lo768 /= linput27set
    &
    (
      lo768 = lovalue07boolean
      =>
      o768 = FALSE
    )
    &
    lo770 /= lo773
    &
    lo770 /= lo776
    &
    (
      lo770 = linput07set
      =>
      o770 = {}
    )
    &
    (
      lo770 = linput17set
      =>
      o770 = {p2,p3}
    )
    &
    (
      lo770 = linput27set
      =>
      o770 = {p1}
    )
    &
    lo770 /= lovalue07boolean
    &
    (
      lo773 = lo776
      =>
      o773 = o776
    )
    &
    lo773 /= linput07set
    &
    lo773 /= linput17set
    &
    lo773 /= linput27set
    &
    (
      lo773 = lovalue07boolean
      =>
      o773 = FALSE
    )
    &
    lo776 /= linput07set
    &
    lo776 /= linput17set
    &
    lo776 /= linput27set
    &
    (
      lo776 = lovalue07boolean
      =>
      o776 = FALSE
    )
    &
    (
      linput07set = linput17set
      =>
      {} = {p2,p3}
    )
    &
    (
      linput07set = linput27set
      =>
      {} = {p1}
    )
    &
    linput07set /= lovalue07boolean
    &
    (
      linput17set = linput27set
      =>
      {p2,p3} = {p1}
    )
    &
    linput17set /= lovalue07boolean
    &
    linput27set /= lovalue07boolean
    &
    card(i755) <= 5
    &
    card(i756) <= 5
    &
    card(i758) <= 5
    &
    card(i759) <= 5
    &
    card(i763) <= 5
    &
    card(i764) <= 5
    &
    card(i766) <= 5
    &
    card(i767) <= 5
    &
    card(i771) <= 5
    &
    card(i772) <= 5
    &
    card(i774) <= 5
    &
    card(i775) <= 5
    &
    card(o754) <= 5
    &
    card(o762) <= 5
    &
    card(o770) <= 5
  )
)
&
#(o776,o773,o770,o768,o765,o762,o760,o757,o754,o752,i775,i774,i772,i771,i767,i766,i764,i763,i759,i758,i756,i755,i751,i750,waiting,ready,active).(
  (
    waiting : POW(PID)
    &
    ready : POW(PID)
    &
    active : POW(PID)
    &
    active = {p3}
    &
    ready = {p3}
    &
    waiting = {p1,p2}
    &
    lovalue010boolean = 12
    &
    linput210set = 2
    &
    linput110set = 1
    &
    linput010set = 0
    &
    (
      (
        i750 = TRUE
        &
        i751 = TRUE
        &
        o752 = TRUE
      )
      or
      (
        (
          i750 = FALSE
          or
          i751 = FALSE
        )
        &
        o752 = FALSE
      )
    )
    &
    constant753 = o754
    &
    (
      i755 = i756
      <=>
      o757 = TRUE
    )
    &
    (
      i758 /= i759
      <=>
      o760 = TRUE
    )
    &
    constant761 = o762
    &
    (
      i763 = i764
      <=>
      o765 = TRUE
    )
    &
    (
      i766 /= i767
      <=>
      o768 = TRUE
    )
    &
    constant769 = o770
    &
    (
      i771 = i772
      <=>
      o773 = TRUE
    )
    &
    (
      i774 /= i775
      <=>
      o776 = TRUE
    )
    &
    li774 <= li775
    &
    li771 <= li772
    &
    li766 <= li767
    &
    li763 <= li764
    &
    li758 <= li759
    &
    li755 <= li756
    &
    li750 <= li751
    &
    (
      li750 = li751
      =>
      i750 = i751
    )
    &
    li750 /= li755
    &
    li750 /= li756
    &
    li750 /= li758
    &
    li750 /= li759
    &
    li750 /= li763
    &
    li750 /= li764
    &
    li750 /= li766
    &
    li750 /= li767
    &
    li750 /= li771
    &
    li750 /= li772
    &
    li750 /= li774
    &
    li750 /= li775
    &
    (
      li750 = lo752
      =>
      i750 = o752
    )
    &
    li750 /= lo754
    &
    (
      li750 = lo757
      =>
      i750 = o757
    )
    &
    (
      li750 = lo760
      =>
      i750 = o760
    )
    &
    li750 /= lo762
    &
    (
      li750 = lo765
      =>
      i750 = o765
    )
    &
    (
      li750 = lo768
      =>
      i750 = o768
    )
    &
    li750 /= lo770
    &
    (
      li750 = lo773
      =>
      i750 = o773
    )
    &
    (
      li750 = lo776
      =>
      i750 = o776
    )
    &
    li750 /= linput010set
    &
    li750 /= linput110set
    &
    li750 /= linput210set
    &
    (
      li750 = lovalue010boolean
      =>
      i750 = FALSE
    )
    &
    li751 /= li755
    &
    li751 /= li756
    &
    li751 /= li758
    &
    li751 /= li759
    &
    li751 /= li763
    &
    li751 /= li764
    &
    li751 /= li766
    &
    li751 /= li767
    &
    li751 /= li771
    &
    li751 /= li772
    &
    li751 /= li774
    &
    li751 /= li775
    &
    (
      li751 = lo752
      =>
      i751 = o752
    )
    &
    li751 /= lo754
    &
    (
      li751 = lo757
      =>
      i751 = o757
    )
    &
    (
      li751 = lo760
      =>
      i751 = o760
    )
    &
    li751 /= lo762
    &
    (
      li751 = lo765
      =>
      i751 = o765
    )
    &
    (
      li751 = lo768
      =>
      i751 = o768
    )
    &
    li751 /= lo770
    &
    (
      li751 = lo773
      =>
      i751 = o773
    )
    &
    (
      li751 = lo776
      =>
      i751 = o776
    )
    &
    li751 /= linput010set
    &
    li751 /= linput110set
    &
    li751 /= linput210set
    &
    (
      li751 = lovalue010boolean
      =>
      i751 = FALSE
    )
    &
    (
      li755 = li756
      =>
      i755 = i756
    )
    &
    (
      li755 = li758
      =>
      i755 = i758
    )
    &
    (
      li755 = li759
      =>
      i755 = i759
    )
    &
    (
      li755 = li763
      =>
      i755 = i763
    )
    &
    (
      li755 = li764
      =>
      i755 = i764
    )
    &
    (
      li755 = li766
      =>
      i755 = i766
    )
    &
    (
      li755 = li767
      =>
      i755 = i767
    )
    &
    (
      li755 = li771
      =>
      i755 = i771
    )
    &
    (
      li755 = li772
      =>
      i755 = i772
    )
    &
    (
      li755 = li774
      =>
      i755 = i774
    )
    &
    (
      li755 = li775
      =>
      i755 = i775
    )
    &
    li755 /= lo752
    &
    (
      li755 = lo754
      =>
      i755 = o754
    )
    &
    li755 /= lo757
    &
    li755 /= lo760
    &
    (
      li755 = lo762
      =>
      i755 = o762
    )
    &
    li755 /= lo765
    &
    li755 /= lo768
    &
    (
      li755 = lo770
      =>
      i755 = o770
    )
    &
    li755 /= lo773
    &
    li755 /= lo776
    &
    (
      li755 = linput010set
      =>
      i755 = {p1,p2}
    )
    &
    (
      li755 = linput110set
      =>
      i755 = {p3}
    )
    &
    (
      li755 = linput210set
      =>
      i755 = {p3}
    )
    &
    li755 /= lovalue010boolean
    &
    (
      li756 = li758
      =>
      i756 = i758
    )
    &
    (
      li756 = li759
      =>
      i756 = i759
    )
    &
    (
      li756 = li763
      =>
      i756 = i763
    )
    &
    (
      li756 = li764
      =>
      i756 = i764
    )
    &
    (
      li756 = li766
      =>
      i756 = i766
    )
    &
    (
      li756 = li767
      =>
      i756 = i767
    )
    &
    (
      li756 = li771
      =>
      i756 = i771
    )
    &
    (
      li756 = li772
      =>
      i756 = i772
    )
    &
    (
      li756 = li774
      =>
      i756 = i774
    )
    &
    (
      li756 = li775
      =>
      i756 = i775
    )
    &
    li756 /= lo752
    &
    (
      li756 = lo754
      =>
      i756 = o754
    )
    &
    li756 /= lo757
    &
    li756 /= lo760
    &
    (
      li756 = lo762
      =>
      i756 = o762
    )
    &
    li756 /= lo765
    &
    li756 /= lo768
    &
    (
      li756 = lo770
      =>
      i756 = o770
    )
    &
    li756 /= lo773
    &
    li756 /= lo776
    &
    (
      li756 = linput010set
      =>
      i756 = {p1,p2}
    )
    &
    (
      li756 = linput110set
      =>
      i756 = {p3}
    )
    &
    (
      li756 = linput210set
      =>
      i756 = {p3}
    )
    &
    li756 /= lovalue010boolean
    &
    (
      li758 = li759
      =>
      i758 = i759
    )
    &
    (
      li758 = li763
      =>
      i758 = i763
    )
    &
    (
      li758 = li764
      =>
      i758 = i764
    )
    &
    (
      li758 = li766
      =>
      i758 = i766
    )
    &
    (
      li758 = li767
      =>
      i758 = i767
    )
    &
    (
      li758 = li771
      =>
      i758 = i771
    )
    &
    (
      li758 = li772
      =>
      i758 = i772
    )
    &
    (
      li758 = li774
      =>
      i758 = i774
    )
    &
    (
      li758 = li775
      =>
      i758 = i775
    )
    &
    li758 /= lo752
    &
    (
      li758 = lo754
      =>
      i758 = o754
    )
    &
    li758 /= lo757
    &
    li758 /= lo760
    &
    (
      li758 = lo762
      =>
      i758 = o762
    )
    &
    li758 /= lo765
    &
    li758 /= lo768
    &
    (
      li758 = lo770
      =>
      i758 = o770
    )
    &
    li758 /= lo773
    &
    li758 /= lo776
    &
    (
      li758 = linput010set
      =>
      i758 = {p1,p2}
    )
    &
    (
      li758 = linput110set
      =>
      i758 = {p3}
    )
    &
    (
      li758 = linput210set
      =>
      i758 = {p3}
    )
    &
    li758 /= lovalue010boolean
    &
    (
      li759 = li763
      =>
      i759 = i763
    )
    &
    (
      li759 = li764
      =>
      i759 = i764
    )
    &
    (
      li759 = li766
      =>
      i759 = i766
    )
    &
    (
      li759 = li767
      =>
      i759 = i767
    )
    &
    (
      li759 = li771
      =>
      i759 = i771
    )
    &
    (
      li759 = li772
      =>
      i759 = i772
    )
    &
    (
      li759 = li774
      =>
      i759 = i774
    )
    &
    (
      li759 = li775
      =>
      i759 = i775
    )
    &
    li759 /= lo752
    &
    (
      li759 = lo754
      =>
      i759 = o754
    )
    &
    li759 /= lo757
    &
    li759 /= lo760
    &
    (
      li759 = lo762
      =>
      i759 = o762
    )
    &
    li759 /= lo765
    &
    li759 /= lo768
    &
    (
      li759 = lo770
      =>
      i759 = o770
    )
    &
    li759 /= lo773
    &
    li759 /= lo776
    &
    (
      li759 = linput010set
      =>
      i759 = {p1,p2}
    )
    &
    (
      li759 = linput110set
      =>
      i759 = {p3}
    )
    &
    (
      li759 = linput210set
      =>
      i759 = {p3}
    )
    &
    li759 /= lovalue010boolean
    &
    (
      li763 = li764
      =>
      i763 = i764
    )
    &
    (
      li763 = li766
      =>
      i763 = i766
    )
    &
    (
      li763 = li767
      =>
      i763 = i767
    )
    &
    (
      li763 = li771
      =>
      i763 = i771
    )
    &
    (
      li763 = li772
      =>
      i763 = i772
    )
    &
    (
      li763 = li774
      =>
      i763 = i774
    )
    &
    (
      li763 = li775
      =>
      i763 = i775
    )
    &
    li763 /= lo752
    &
    (
      li763 = lo754
      =>
      i763 = o754
    )
    &
    li763 /= lo757
    &
    li763 /= lo760
    &
    (
      li763 = lo762
      =>
      i763 = o762
    )
    &
    li763 /= lo765
    &
    li763 /= lo768
    &
    (
      li763 = lo770
      =>
      i763 = o770
    )
    &
    li763 /= lo773
    &
    li763 /= lo776
    &
    (
      li763 = linput010set
      =>
      i763 = {p1,p2}
    )
    &
    (
      li763 = linput110set
      =>
      i763 = {p3}
    )
    &
    (
      li763 = linput210set
      =>
      i763 = {p3}
    )
    &
    li763 /= lovalue010boolean
    &
    (
      li764 = li766
      =>
      i764 = i766
    )
    &
    (
      li764 = li767
      =>
      i764 = i767
    )
    &
    (
      li764 = li771
      =>
      i764 = i771
    )
    &
    (
      li764 = li772
      =>
      i764 = i772
    )
    &
    (
      li764 = li774
      =>
      i764 = i774
    )
    &
    (
      li764 = li775
      =>
      i764 = i775
    )
    &
    li764 /= lo752
    &
    (
      li764 = lo754
      =>
      i764 = o754
    )
    &
    li764 /= lo757
    &
    li764 /= lo760
    &
    (
      li764 = lo762
      =>
      i764 = o762
    )
    &
    li764 /= lo765
    &
    li764 /= lo768
    &
    (
      li764 = lo770
      =>
      i764 = o770
    )
    &
    li764 /= lo773
    &
    li764 /= lo776
    &
    (
      li764 = linput010set
      =>
      i764 = {p1,p2}
    )
    &
    (
      li764 = linput110set
      =>
      i764 = {p3}
    )
    &
    (
      li764 = linput210set
      =>
      i764 = {p3}
    )
    &
    li764 /= lovalue010boolean
    &
    (
      li766 = li767
      =>
      i766 = i767
    )
    &
    (
      li766 = li771
      =>
      i766 = i771
    )
    &
    (
      li766 = li772
      =>
      i766 = i772
    )
    &
    (
      li766 = li774
      =>
      i766 = i774
    )
    &
    (
      li766 = li775
      =>
      i766 = i775
    )
    &
    li766 /= lo752
    &
    (
      li766 = lo754
      =>
      i766 = o754
    )
    &
    li766 /= lo757
    &
    li766 /= lo760
    &
    (
      li766 = lo762
      =>
      i766 = o762
    )
    &
    li766 /= lo765
    &
    li766 /= lo768
    &
    (
      li766 = lo770
      =>
      i766 = o770
    )
    &
    li766 /= lo773
    &
    li766 /= lo776
    &
    (
      li766 = linput010set
      =>
      i766 = {p1,p2}
    )
    &
    (
      li766 = linput110set
      =>
      i766 = {p3}
    )
    &
    (
      li766 = linput210set
      =>
      i766 = {p3}
    )
    &
    li766 /= lovalue010boolean
    &
    (
      li767 = li771
      =>
      i767 = i771
    )
    &
    (
      li767 = li772
      =>
      i767 = i772
    )
    &
    (
      li767 = li774
      =>
      i767 = i774
    )
    &
    (
      li767 = li775
      =>
      i767 = i775
    )
    &
    li767 /= lo752
    &
    (
      li767 = lo754
      =>
      i767 = o754
    )
    &
    li767 /= lo757
    &
    li767 /= lo760
    &
    (
      li767 = lo762
      =>
      i767 = o762
    )
    &
    li767 /= lo765
    &
    li767 /= lo768
    &
    (
      li767 = lo770
      =>
      i767 = o770
    )
    &
    li767 /= lo773
    &
    li767 /= lo776
    &
    (
      li767 = linput010set
      =>
      i767 = {p1,p2}
    )
    &
    (
      li767 = linput110set
      =>
      i767 = {p3}
    )
    &
    (
      li767 = linput210set
      =>
      i767 = {p3}
    )
    &
    li767 /= lovalue010boolean
    &
    (
      li771 = li772
      =>
      i771 = i772
    )
    &
    (
      li771 = li774
      =>
      i771 = i774
    )
    &
    (
      li771 = li775
      =>
      i771 = i775
    )
    &
    li771 /= lo752
    &
    (
      li771 = lo754
      =>
      i771 = o754
    )
    &
    li771 /= lo757
    &
    li771 /= lo760
    &
    (
      li771 = lo762
      =>
      i771 = o762
    )
    &
    li771 /= lo765
    &
    li771 /= lo768
    &
    (
      li771 = lo770
      =>
      i771 = o770
    )
    &
    li771 /= lo773
    &
    li771 /= lo776
    &
    (
      li771 = linput010set
      =>
      i771 = {p1,p2}
    )
    &
    (
      li771 = linput110set
      =>
      i771 = {p3}
    )
    &
    (
      li771 = linput210set
      =>
      i771 = {p3}
    )
    &
    li771 /= lovalue010boolean
    &
    (
      li772 = li774
      =>
      i772 = i774
    )
    &
    (
      li772 = li775
      =>
      i772 = i775
    )
    &
    li772 /= lo752
    &
    (
      li772 = lo754
      =>
      i772 = o754
    )
    &
    li772 /= lo757
    &
    li772 /= lo760
    &
    (
      li772 = lo762
      =>
      i772 = o762
    )
    &
    li772 /= lo765
    &
    li772 /= lo768
    &
    (
      li772 = lo770
      =>
      i772 = o770
    )
    &
    li772 /= lo773
    &
    li772 /= lo776
    &
    (
      li772 = linput010set
      =>
      i772 = {p1,p2}
    )
    &
    (
      li772 = linput110set
      =>
      i772 = {p3}
    )
    &
    (
      li772 = linput210set
      =>
      i772 = {p3}
    )
    &
    li772 /= lovalue010boolean
    &
    (
      li774 = li775
      =>
      i774 = i775
    )
    &
    li774 /= lo752
    &
    (
      li774 = lo754
      =>
      i774 = o754
    )
    &
    li774 /= lo757
    &
    li774 /= lo760
    &
    (
      li774 = lo762
      =>
      i774 = o762
    )
    &
    li774 /= lo765
    &
    li774 /= lo768
    &
    (
      li774 = lo770
      =>
      i774 = o770
    )
    &
    li774 /= lo773
    &
    li774 /= lo776
    &
    (
      li774 = linput010set
      =>
      i774 = {p1,p2}
    )
    &
    (
      li774 = linput110set
      =>
      i774 = {p3}
    )
    &
    (
      li774 = linput210set
      =>
      i774 = {p3}
    )
    &
    li774 /= lovalue010boolean
    &
    li775 /= lo752
    &
    (
      li775 = lo754
      =>
      i775 = o754
    )
    &
    li775 /= lo757
    &
    li775 /= lo760
    &
    (
      li775 = lo762
      =>
      i775 = o762
    )
    &
    li775 /= lo765
    &
    li775 /= lo768
    &
    (
      li775 = lo770
      =>
      i775 = o770
    )
    &
    li775 /= lo773
    &
    li775 /= lo776
    &
    (
      li775 = linput010set
      =>
      i775 = {p1,p2}
    )
    &
    (
      li775 = linput110set
      =>
      i775 = {p3}
    )
    &
    (
      li775 = linput210set
      =>
      i775 = {p3}
    )
    &
    li775 /= lovalue010boolean
    &
    lo752 /= lo754
    &
    (
      lo752 = lo757
      =>
      o752 = o757
    )
    &
    (
      lo752 = lo760
      =>
      o752 = o760
    )
    &
    lo752 /= lo762
    &
    (
      lo752 = lo765
      =>
      o752 = o765
    )
    &
    (
      lo752 = lo768
      =>
      o752 = o768
    )
    &
    lo752 /= lo770
    &
    (
      lo752 = lo773
      =>
      o752 = o773
    )
    &
    (
      lo752 = lo776
      =>
      o752 = o776
    )
    &
    lo752 /= linput010set
    &
    lo752 /= linput110set
    &
    lo752 /= linput210set
    &
    (
      lo752 = lovalue010boolean
      =>
      o752 = FALSE
    )
    &
    lo754 /= lo757
    &
    lo754 /= lo760
    &
    (
      lo754 = lo762
      =>
      o754 = o762
    )
    &
    lo754 /= lo765
    &
    lo754 /= lo768
    &
    (
      lo754 = lo770
      =>
      o754 = o770
    )
    &
    lo754 /= lo773
    &
    lo754 /= lo776
    &
    (
      lo754 = linput010set
      =>
      o754 = {p1,p2}
    )
    &
    (
      lo754 = linput110set
      =>
      o754 = {p3}
    )
    &
    (
      lo754 = linput210set
      =>
      o754 = {p3}
    )
    &
    lo754 /= lovalue010boolean
    &
    (
      lo757 = lo760
      =>
      o757 = o760
    )
    &
    lo757 /= lo762
    &
    (
      lo757 = lo765
      =>
      o757 = o765
    )
    &
    (
      lo757 = lo768
      =>
      o757 = o768
    )
    &
    lo757 /= lo770
    &
    (
      lo757 = lo773
      =>
      o757 = o773
    )
    &
    (
      lo757 = lo776
      =>
      o757 = o776
    )
    &
    lo757 /= linput010set
    &
    lo757 /= linput110set
    &
    lo757 /= linput210set
    &
    (
      lo757 = lovalue010boolean
      =>
      o757 = FALSE
    )
    &
    lo760 /= lo762
    &
    (
      lo760 = lo765
      =>
      o760 = o765
    )
    &
    (
      lo760 = lo768
      =>
      o760 = o768
    )
    &
    lo760 /= lo770
    &
    (
      lo760 = lo773
      =>
      o760 = o773
    )
    &
    (
      lo760 = lo776
      =>
      o760 = o776
    )
    &
    lo760 /= linput010set
    &
    lo760 /= linput110set
    &
    lo760 /= linput210set
    &
    (
      lo760 = lovalue010boolean
      =>
      o760 = FALSE
    )
    &
    lo762 /= lo765
    &
    lo762 /= lo768
    &
    (
      lo762 = lo770
      =>
      o762 = o770
    )
    &
    lo762 /= lo773
    &
    lo762 /= lo776
    &
    (
      lo762 = linput010set
      =>
      o762 = {p1,p2}
    )
    &
    (
      lo762 = linput110set
      =>
      o762 = {p3}
    )
    &
    (
      lo762 = linput210set
      =>
      o762 = {p3}
    )
    &
    lo762 /= lovalue010boolean
    &
    (
      lo765 = lo768
      =>
      o765 = o768
    )
    &
    lo765 /= lo770
    &
    (
      lo765 = lo773
      =>
      o765 = o773
    )
    &
    (
      lo765 = lo776
      =>
      o765 = o776
    )
    &
    lo765 /= linput010set
    &
    lo765 /= linput110set
    &
    lo765 /= linput210set
    &
    (
      lo765 = lovalue010boolean
      =>
      o765 = FALSE
    )
    &
    lo768 /= lo770
    &
    (
      lo768 = lo773
      =>
      o768 = o773
    )
    &
    (
      lo768 = lo776
      =>
      o768 = o776
    )
    &
    lo768 /= linput010set
    &
    lo768 /= linput110set
    &
    lo768 /= linput210set
    &
    (
      lo768 = lovalue010boolean
      =>
      o768 = FALSE
    )
    &
    lo770 /= lo773
    &
    lo770 /= lo776
    &
    (
      lo770 = linput010set
      =>
      o770 = {p1,p2}
    )
    &
    (
      lo770 = linput110set
      =>
      o770 = {p3}
    )
    &
    (
      lo770 = linput210set
      =>
      o770 = {p3}
    )
    &
    lo770 /= lovalue010boolean
    &
    (
      lo773 = lo776
      =>
      o773 = o776
    )
    &
    lo773 /= linput010set
    &
    lo773 /= linput110set
    &
    lo773 /= linput210set
    &
    (
      lo773 = lovalue010boolean
      =>
      o773 = FALSE
    )
    &
    lo776 /= linput010set
    &
    lo776 /= linput110set
    &
    lo776 /= linput210set
    &
    (
      lo776 = lovalue010boolean
      =>
      o776 = FALSE
    )
    &
    (
      linput010set = linput110set
      =>
      {p1,p2} = {p3}
    )
    &
    (
      linput010set = linput210set
      =>
      {p1,p2} = {p3}
    )
    &
    linput010set /= lovalue010boolean
    &
    (
      linput110set = linput210set
      =>
      {p3} = {p3}
    )
    &
    linput110set /= lovalue010boolean
    &
    linput210set /= lovalue010boolean
    &
    card(i755) <= 5
    &
    card(i756) <= 5
    &
    card(i758) <= 5
    &
    card(i759) <= 5
    &
    card(i763) <= 5
    &
    card(i764) <= 5
    &
    card(i766) <= 5
    &
    card(i767) <= 5
    &
    card(i771) <= 5
    &
    card(i772) <= 5
    &
    card(i774) <= 5
    &
    card(i775) <= 5
    &
    card(o754) <= 5
    &
    card(o762) <= 5
    &
    card(o770) <= 5
  )
)
&
#(o776,o773,o770,o768,o765,o762,o760,o757,o754,o752,i775,i774,i772,i771,i767,i766,i764,i763,i759,i758,i756,i755,i751,i750,active,ready,waiting).(
  (
    active : POW(PID)
    &
    ready : POW(PID)
    &
    waiting : POW(PID)
    &
    waiting = {}
    &
    ready = {p1}
    &
    active = {p3}
    &
    lovalue012boolean = 12
    &
    linput212set = 2
    &
    linput112set = 1
    &
    linput012set = 0
    &
    (
      (
        i750 = TRUE
        &
        i751 = TRUE
        &
        o752 = TRUE
      )
      or
      (
        (
          i750 = FALSE
          or
          i751 = FALSE
        )
        &
        o752 = FALSE
      )
    )
    &
    constant753 = o754
    &
    (
      i755 = i756
      <=>
      o757 = TRUE
    )
    &
    (
      i758 /= i759
      <=>
      o760 = TRUE
    )
    &
    constant761 = o762
    &
    (
      i763 = i764
      <=>
      o765 = TRUE
    )
    &
    (
      i766 /= i767
      <=>
      o768 = TRUE
    )
    &
    constant769 = o770
    &
    (
      i771 = i772
      <=>
      o773 = TRUE
    )
    &
    (
      i774 /= i775
      <=>
      o776 = TRUE
    )
    &
    li774 <= li775
    &
    li771 <= li772
    &
    li766 <= li767
    &
    li763 <= li764
    &
    li758 <= li759
    &
    li755 <= li756
    &
    li750 <= li751
    &
    (
      li750 = li751
      =>
      i750 = i751
    )
    &
    li750 /= li755
    &
    li750 /= li756
    &
    li750 /= li758
    &
    li750 /= li759
    &
    li750 /= li763
    &
    li750 /= li764
    &
    li750 /= li766
    &
    li750 /= li767
    &
    li750 /= li771
    &
    li750 /= li772
    &
    li750 /= li774
    &
    li750 /= li775
    &
    (
      li750 = lo752
      =>
      i750 = o752
    )
    &
    li750 /= lo754
    &
    (
      li750 = lo757
      =>
      i750 = o757
    )
    &
    (
      li750 = lo760
      =>
      i750 = o760
    )
    &
    li750 /= lo762
    &
    (
      li750 = lo765
      =>
      i750 = o765
    )
    &
    (
      li750 = lo768
      =>
      i750 = o768
    )
    &
    li750 /= lo770
    &
    (
      li750 = lo773
      =>
      i750 = o773
    )
    &
    (
      li750 = lo776
      =>
      i750 = o776
    )
    &
    li750 /= linput012set
    &
    li750 /= linput112set
    &
    li750 /= linput212set
    &
    (
      li750 = lovalue012boolean
      =>
      i750 = FALSE
    )
    &
    li751 /= li755
    &
    li751 /= li756
    &
    li751 /= li758
    &
    li751 /= li759
    &
    li751 /= li763
    &
    li751 /= li764
    &
    li751 /= li766
    &
    li751 /= li767
    &
    li751 /= li771
    &
    li751 /= li772
    &
    li751 /= li774
    &
    li751 /= li775
    &
    (
      li751 = lo752
      =>
      i751 = o752
    )
    &
    li751 /= lo754
    &
    (
      li751 = lo757
      =>
      i751 = o757
    )
    &
    (
      li751 = lo760
      =>
      i751 = o760
    )
    &
    li751 /= lo762
    &
    (
      li751 = lo765
      =>
      i751 = o765
    )
    &
    (
      li751 = lo768
      =>
      i751 = o768
    )
    &
    li751 /= lo770
    &
    (
      li751 = lo773
      =>
      i751 = o773
    )
    &
    (
      li751 = lo776
      =>
      i751 = o776
    )
    &
    li751 /= linput012set
    &
    li751 /= linput112set
    &
    li751 /= linput212set
    &
    (
      li751 = lovalue012boolean
      =>
      i751 = FALSE
    )
    &
    (
      li755 = li756
      =>
      i755 = i756
    )
    &
    (
      li755 = li758
      =>
      i755 = i758
    )
    &
    (
      li755 = li759
      =>
      i755 = i759
    )
    &
    (
      li755 = li763
      =>
      i755 = i763
    )
    &
    (
      li755 = li764
      =>
      i755 = i764
    )
    &
    (
      li755 = li766
      =>
      i755 = i766
    )
    &
    (
      li755 = li767
      =>
      i755 = i767
    )
    &
    (
      li755 = li771
      =>
      i755 = i771
    )
    &
    (
      li755 = li772
      =>
      i755 = i772
    )
    &
    (
      li755 = li774
      =>
      i755 = i774
    )
    &
    (
      li755 = li775
      =>
      i755 = i775
    )
    &
    li755 /= lo752
    &
    (
      li755 = lo754
      =>
      i755 = o754
    )
    &
    li755 /= lo757
    &
    li755 /= lo760
    &
    (
      li755 = lo762
      =>
      i755 = o762
    )
    &
    li755 /= lo765
    &
    li755 /= lo768
    &
    (
      li755 = lo770
      =>
      i755 = o770
    )
    &
    li755 /= lo773
    &
    li755 /= lo776
    &
    (
      li755 = linput012set
      =>
      i755 = {p3}
    )
    &
    (
      li755 = linput112set
      =>
      i755 = {p1}
    )
    &
    (
      li755 = linput212set
      =>
      i755 = {}
    )
    &
    li755 /= lovalue012boolean
    &
    (
      li756 = li758
      =>
      i756 = i758
    )
    &
    (
      li756 = li759
      =>
      i756 = i759
    )
    &
    (
      li756 = li763
      =>
      i756 = i763
    )
    &
    (
      li756 = li764
      =>
      i756 = i764
    )
    &
    (
      li756 = li766
      =>
      i756 = i766
    )
    &
    (
      li756 = li767
      =>
      i756 = i767
    )
    &
    (
      li756 = li771
      =>
      i756 = i771
    )
    &
    (
      li756 = li772
      =>
      i756 = i772
    )
    &
    (
      li756 = li774
      =>
      i756 = i774
    )
    &
    (
      li756 = li775
      =>
      i756 = i775
    )
    &
    li756 /= lo752
    &
    (
      li756 = lo754
      =>
      i756 = o754
    )
    &
    li756 /= lo757
    &
    li756 /= lo760
    &
    (
      li756 = lo762
      =>
      i756 = o762
    )
    &
    li756 /= lo765
    &
    li756 /= lo768
    &
    (
      li756 = lo770
      =>
      i756 = o770
    )
    &
    li756 /= lo773
    &
    li756 /= lo776
    &
    (
      li756 = linput012set
      =>
      i756 = {p3}
    )
    &
    (
      li756 = linput112set
      =>
      i756 = {p1}
    )
    &
    (
      li756 = linput212set
      =>
      i756 = {}
    )
    &
    li756 /= lovalue012boolean
    &
    (
      li758 = li759
      =>
      i758 = i759
    )
    &
    (
      li758 = li763
      =>
      i758 = i763
    )
    &
    (
      li758 = li764
      =>
      i758 = i764
    )
    &
    (
      li758 = li766
      =>
      i758 = i766
    )
    &
    (
      li758 = li767
      =>
      i758 = i767
    )
    &
    (
      li758 = li771
      =>
      i758 = i771
    )
    &
    (
      li758 = li772
      =>
      i758 = i772
    )
    &
    (
      li758 = li774
      =>
      i758 = i774
    )
    &
    (
      li758 = li775
      =>
      i758 = i775
    )
    &
    li758 /= lo752
    &
    (
      li758 = lo754
      =>
      i758 = o754
    )
    &
    li758 /= lo757
    &
    li758 /= lo760
    &
    (
      li758 = lo762
      =>
      i758 = o762
    )
    &
    li758 /= lo765
    &
    li758 /= lo768
    &
    (
      li758 = lo770
      =>
      i758 = o770
    )
    &
    li758 /= lo773
    &
    li758 /= lo776
    &
    (
      li758 = linput012set
      =>
      i758 = {p3}
    )
    &
    (
      li758 = linput112set
      =>
      i758 = {p1}
    )
    &
    (
      li758 = linput212set
      =>
      i758 = {}
    )
    &
    li758 /= lovalue012boolean
    &
    (
      li759 = li763
      =>
      i759 = i763
    )
    &
    (
      li759 = li764
      =>
      i759 = i764
    )
    &
    (
      li759 = li766
      =>
      i759 = i766
    )
    &
    (
      li759 = li767
      =>
      i759 = i767
    )
    &
    (
      li759 = li771
      =>
      i759 = i771
    )
    &
    (
      li759 = li772
      =>
      i759 = i772
    )
    &
    (
      li759 = li774
      =>
      i759 = i774
    )
    &
    (
      li759 = li775
      =>
      i759 = i775
    )
    &
    li759 /= lo752
    &
    (
      li759 = lo754
      =>
      i759 = o754
    )
    &
    li759 /= lo757
    &
    li759 /= lo760
    &
    (
      li759 = lo762
      =>
      i759 = o762
    )
    &
    li759 /= lo765
    &
    li759 /= lo768
    &
    (
      li759 = lo770
      =>
      i759 = o770
    )
    &
    li759 /= lo773
    &
    li759 /= lo776
    &
    (
      li759 = linput012set
      =>
      i759 = {p3}
    )
    &
    (
      li759 = linput112set
      =>
      i759 = {p1}
    )
    &
    (
      li759 = linput212set
      =>
      i759 = {}
    )
    &
    li759 /= lovalue012boolean
    &
    (
      li763 = li764
      =>
      i763 = i764
    )
    &
    (
      li763 = li766
      =>
      i763 = i766
    )
    &
    (
      li763 = li767
      =>
      i763 = i767
    )
    &
    (
      li763 = li771
      =>
      i763 = i771
    )
    &
    (
      li763 = li772
      =>
      i763 = i772
    )
    &
    (
      li763 = li774
      =>
      i763 = i774
    )
    &
    (
      li763 = li775
      =>
      i763 = i775
    )
    &
    li763 /= lo752
    &
    (
      li763 = lo754
      =>
      i763 = o754
    )
    &
    li763 /= lo757
    &
    li763 /= lo760
    &
    (
      li763 = lo762
      =>
      i763 = o762
    )
    &
    li763 /= lo765
    &
    li763 /= lo768
    &
    (
      li763 = lo770
      =>
      i763 = o770
    )
    &
    li763 /= lo773
    &
    li763 /= lo776
    &
    (
      li763 = linput012set
      =>
      i763 = {p3}
    )
    &
    (
      li763 = linput112set
      =>
      i763 = {p1}
    )
    &
    (
      li763 = linput212set
      =>
      i763 = {}
    )
    &
    li763 /= lovalue012boolean
    &
    (
      li764 = li766
      =>
      i764 = i766
    )
    &
    (
      li764 = li767
      =>
      i764 = i767
    )
    &
    (
      li764 = li771
      =>
      i764 = i771
    )
    &
    (
      li764 = li772
      =>
      i764 = i772
    )
    &
    (
      li764 = li774
      =>
      i764 = i774
    )
    &
    (
      li764 = li775
      =>
      i764 = i775
    )
    &
    li764 /= lo752
    &
    (
      li764 = lo754
      =>
      i764 = o754
    )
    &
    li764 /= lo757
    &
    li764 /= lo760
    &
    (
      li764 = lo762
      =>
      i764 = o762
    )
    &
    li764 /= lo765
    &
    li764 /= lo768
    &
    (
      li764 = lo770
      =>
      i764 = o770
    )
    &
    li764 /= lo773
    &
    li764 /= lo776
    &
    (
      li764 = linput012set
      =>
      i764 = {p3}
    )
    &
    (
      li764 = linput112set
      =>
      i764 = {p1}
    )
    &
    (
      li764 = linput212set
      =>
      i764 = {}
    )
    &
    li764 /= lovalue012boolean
    &
    (
      li766 = li767
      =>
      i766 = i767
    )
    &
    (
      li766 = li771
      =>
      i766 = i771
    )
    &
    (
      li766 = li772
      =>
      i766 = i772
    )
    &
    (
      li766 = li774
      =>
      i766 = i774
    )
    &
    (
      li766 = li775
      =>
      i766 = i775
    )
    &
    li766 /= lo752
    &
    (
      li766 = lo754
      =>
      i766 = o754
    )
    &
    li766 /= lo757
    &
    li766 /= lo760
    &
    (
      li766 = lo762
      =>
      i766 = o762
    )
    &
    li766 /= lo765
    &
    li766 /= lo768
    &
    (
      li766 = lo770
      =>
      i766 = o770
    )
    &
    li766 /= lo773
    &
    li766 /= lo776
    &
    (
      li766 = linput012set
      =>
      i766 = {p3}
    )
    &
    (
      li766 = linput112set
      =>
      i766 = {p1}
    )
    &
    (
      li766 = linput212set
      =>
      i766 = {}
    )
    &
    li766 /= lovalue012boolean
    &
    (
      li767 = li771
      =>
      i767 = i771
    )
    &
    (
      li767 = li772
      =>
      i767 = i772
    )
    &
    (
      li767 = li774
      =>
      i767 = i774
    )
    &
    (
      li767 = li775
      =>
      i767 = i775
    )
    &
    li767 /= lo752
    &
    (
      li767 = lo754
      =>
      i767 = o754
    )
    &
    li767 /= lo757
    &
    li767 /= lo760
    &
    (
      li767 = lo762
      =>
      i767 = o762
    )
    &
    li767 /= lo765
    &
    li767 /= lo768
    &
    (
      li767 = lo770
      =>
      i767 = o770
    )
    &
    li767 /= lo773
    &
    li767 /= lo776
    &
    (
      li767 = linput012set
      =>
      i767 = {p3}
    )
    &
    (
      li767 = linput112set
      =>
      i767 = {p1}
    )
    &
    (
      li767 = linput212set
      =>
      i767 = {}
    )
    &
    li767 /= lovalue012boolean
    &
    (
      li771 = li772
      =>
      i771 = i772
    )
    &
    (
      li771 = li774
      =>
      i771 = i774
    )
    &
    (
      li771 = li775
      =>
      i771 = i775
    )
    &
    li771 /= lo752
    &
    (
      li771 = lo754
      =>
      i771 = o754
    )
    &
    li771 /= lo757
    &
    li771 /= lo760
    &
    (
      li771 = lo762
      =>
      i771 = o762
    )
    &
    li771 /= lo765
    &
    li771 /= lo768
    &
    (
      li771 = lo770
      =>
      i771 = o770
    )
    &
    li771 /= lo773
    &
    li771 /= lo776
    &
    (
      li771 = linput012set
      =>
      i771 = {p3}
    )
    &
    (
      li771 = linput112set
      =>
      i771 = {p1}
    )
    &
    (
      li771 = linput212set
      =>
      i771 = {}
    )
    &
    li771 /= lovalue012boolean
    &
    (
      li772 = li774
      =>
      i772 = i774
    )
    &
    (
      li772 = li775
      =>
      i772 = i775
    )
    &
    li772 /= lo752
    &
    (
      li772 = lo754
      =>
      i772 = o754
    )
    &
    li772 /= lo757
    &
    li772 /= lo760
    &
    (
      li772 = lo762
      =>
      i772 = o762
    )
    &
    li772 /= lo765
    &
    li772 /= lo768
    &
    (
      li772 = lo770
      =>
      i772 = o770
    )
    &
    li772 /= lo773
    &
    li772 /= lo776
    &
    (
      li772 = linput012set
      =>
      i772 = {p3}
    )
    &
    (
      li772 = linput112set
      =>
      i772 = {p1}
    )
    &
    (
      li772 = linput212set
      =>
      i772 = {}
    )
    &
    li772 /= lovalue012boolean
    &
    (
      li774 = li775
      =>
      i774 = i775
    )
    &
    li774 /= lo752
    &
    (
      li774 = lo754
      =>
      i774 = o754
    )
    &
    li774 /= lo757
    &
    li774 /= lo760
    &
    (
      li774 = lo762
      =>
      i774 = o762
    )
    &
    li774 /= lo765
    &
    li774 /= lo768
    &
    (
      li774 = lo770
      =>
      i774 = o770
    )
    &
    li774 /= lo773
    &
    li774 /= lo776
    &
    (
      li774 = linput012set
      =>
      i774 = {p3}
    )
    &
    (
      li774 = linput112set
      =>
      i774 = {p1}
    )
    &
    (
      li774 = linput212set
      =>
      i774 = {}
    )
    &
    li774 /= lovalue012boolean
    &
    li775 /= lo752
    &
    (
      li775 = lo754
      =>
      i775 = o754
    )
    &
    li775 /= lo757
    &
    li775 /= lo760
    &
    (
      li775 = lo762
      =>
      i775 = o762
    )
    &
    li775 /= lo765
    &
    li775 /= lo768
    &
    (
      li775 = lo770
      =>
      i775 = o770
    )
    &
    li775 /= lo773
    &
    li775 /= lo776
    &
    (
      li775 = linput012set
      =>
      i775 = {p3}
    )
    &
    (
      li775 = linput112set
      =>
      i775 = {p1}
    )
    &
    (
      li775 = linput212set
      =>
      i775 = {}
    )
    &
    li775 /= lovalue012boolean
    &
    lo752 /= lo754
    &
    (
      lo752 = lo757
      =>
      o752 = o757
    )
    &
    (
      lo752 = lo760
      =>
      o752 = o760
    )
    &
    lo752 /= lo762
    &
    (
      lo752 = lo765
      =>
      o752 = o765
    )
    &
    (
      lo752 = lo768
      =>
      o752 = o768
    )
    &
    lo752 /= lo770
    &
    (
      lo752 = lo773
      =>
      o752 = o773
    )
    &
    (
      lo752 = lo776
      =>
      o752 = o776
    )
    &
    lo752 /= linput012set
    &
    lo752 /= linput112set
    &
    lo752 /= linput212set
    &
    (
      lo752 = lovalue012boolean
      =>
      o752 = FALSE
    )
    &
    lo754 /= lo757
    &
    lo754 /= lo760
    &
    (
      lo754 = lo762
      =>
      o754 = o762
    )
    &
    lo754 /= lo765
    &
    lo754 /= lo768
    &
    (
      lo754 = lo770
      =>
      o754 = o770
    )
    &
    lo754 /= lo773
    &
    lo754 /= lo776
    &
    (
      lo754 = linput012set
      =>
      o754 = {p3}
    )
    &
    (
      lo754 = linput112set
      =>
      o754 = {p1}
    )
    &
    (
      lo754 = linput212set
      =>
      o754 = {}
    )
    &
    lo754 /= lovalue012boolean
    &
    (
      lo757 = lo760
      =>
      o757 = o760
    )
    &
    lo757 /= lo762
    &
    (
      lo757 = lo765
      =>
      o757 = o765
    )
    &
    (
      lo757 = lo768
      =>
      o757 = o768
    )
    &
    lo757 /= lo770
    &
    (
      lo757 = lo773
      =>
      o757 = o773
    )
    &
    (
      lo757 = lo776
      =>
      o757 = o776
    )
    &
    lo757 /= linput012set
    &
    lo757 /= linput112set
    &
    lo757 /= linput212set
    &
    (
      lo757 = lovalue012boolean
      =>
      o757 = FALSE
    )
    &
    lo760 /= lo762
    &
    (
      lo760 = lo765
      =>
      o760 = o765
    )
    &
    (
      lo760 = lo768
      =>
      o760 = o768
    )
    &
    lo760 /= lo770
    &
    (
      lo760 = lo773
      =>
      o760 = o773
    )
    &
    (
      lo760 = lo776
      =>
      o760 = o776
    )
    &
    lo760 /= linput012set
    &
    lo760 /= linput112set
    &
    lo760 /= linput212set
    &
    (
      lo760 = lovalue012boolean
      =>
      o760 = FALSE
    )
    &
    lo762 /= lo765
    &
    lo762 /= lo768
    &
    (
      lo762 = lo770
      =>
      o762 = o770
    )
    &
    lo762 /= lo773
    &
    lo762 /= lo776
    &
    (
      lo762 = linput012set
      =>
      o762 = {p3}
    )
    &
    (
      lo762 = linput112set
      =>
      o762 = {p1}
    )
    &
    (
      lo762 = linput212set
      =>
      o762 = {}
    )
    &
    lo762 /= lovalue012boolean
    &
    (
      lo765 = lo768
      =>
      o765 = o768
    )
    &
    lo765 /= lo770
    &
    (
      lo765 = lo773
      =>
      o765 = o773
    )
    &
    (
      lo765 = lo776
      =>
      o765 = o776
    )
    &
    lo765 /= linput012set
    &
    lo765 /= linput112set
    &
    lo765 /= linput212set
    &
    (
      lo765 = lovalue012boolean
      =>
      o765 = FALSE
    )
    &
    lo768 /= lo770
    &
    (
      lo768 = lo773
      =>
      o768 = o773
    )
    &
    (
      lo768 = lo776
      =>
      o768 = o776
    )
    &
    lo768 /= linput012set
    &
    lo768 /= linput112set
    &
    lo768 /= linput212set
    &
    (
      lo768 = lovalue012boolean
      =>
      o768 = FALSE
    )
    &
    lo770 /= lo773
    &
    lo770 /= lo776
    &
    (
      lo770 = linput012set
      =>
      o770 = {p3}
    )
    &
    (
      lo770 = linput112set
      =>
      o770 = {p1}
    )
    &
    (
      lo770 = linput212set
      =>
      o770 = {}
    )
    &
    lo770 /= lovalue012boolean
    &
    (
      lo773 = lo776
      =>
      o773 = o776
    )
    &
    lo773 /= linput012set
    &
    lo773 /= linput112set
    &
    lo773 /= linput212set
    &
    (
      lo773 = lovalue012boolean
      =>
      o773 = FALSE
    )
    &
    lo776 /= linput012set
    &
    lo776 /= linput112set
    &
    lo776 /= linput212set
    &
    (
      lo776 = lovalue012boolean
      =>
      o776 = FALSE
    )
    &
    (
      linput012set = linput112set
      =>
      {p3} = {p1}
    )
    &
    (
      linput012set = linput212set
      =>
      {p3} = {}
    )
    &
    linput012set /= lovalue012boolean
    &
    (
      linput112set = linput212set
      =>
      {p1} = {}
    )
    &
    linput112set /= lovalue012boolean
    &
    linput212set /= lovalue012boolean
    &
    card(i755) <= 5
    &
    card(i756) <= 5
    &
    card(i758) <= 5
    &
    card(i759) <= 5
    &
    card(i763) <= 5
    &
    card(i764) <= 5
    &
    card(i766) <= 5
    &
    card(i767) <= 5
    &
    card(i771) <= 5
    &
    card(i772) <= 5
    &
    card(i774) <= 5
    &
    card(i775) <= 5
    &
    card(o754) <= 5
    &
    card(o762) <= 5
    &
    card(o770) <= 5
  )
)
&
#(o776,o773,o770,o768,o765,o762,o760,o757,o754,o752,i775,i774,i772,i771,i767,i766,i764,i763,i759,i758,i756,i755,i751,i750,active,ready,waiting).(
  (
    active : POW(PID)
    &
    ready : POW(PID)
    &
    waiting : POW(PID)
    &
    waiting = {p1}
    &
    ready = {p2}
    &
    active = {p3}
    &
    lovalue013boolean = 12
    &
    linput213set = 2
    &
    linput113set = 1
    &
    linput013set = 0
    &
    (
      (
        i750 = TRUE
        &
        i751 = TRUE
        &
        o752 = TRUE
      )
      or
      (
        (
          i750 = FALSE
          or
          i751 = FALSE
        )
        &
        o752 = FALSE
      )
    )
    &
    constant753 = o754
    &
    (
      i755 = i756
      <=>
      o757 = TRUE
    )
    &
    (
      i758 /= i759
      <=>
      o760 = TRUE
    )
    &
    constant761 = o762
    &
    (
      i763 = i764
      <=>
      o765 = TRUE
    )
    &
    (
      i766 /= i767
      <=>
      o768 = TRUE
    )
    &
    constant769 = o770
    &
    (
      i771 = i772
      <=>
      o773 = TRUE
    )
    &
    (
      i774 /= i775
      <=>
      o776 = TRUE
    )
    &
    li774 <= li775
    &
    li771 <= li772
    &
    li766 <= li767
    &
    li763 <= li764
    &
    li758 <= li759
    &
    li755 <= li756
    &
    li750 <= li751
    &
    (
      li750 = li751
      =>
      i750 = i751
    )
    &
    li750 /= li755
    &
    li750 /= li756
    &
    li750 /= li758
    &
    li750 /= li759
    &
    li750 /= li763
    &
    li750 /= li764
    &
    li750 /= li766
    &
    li750 /= li767
    &
    li750 /= li771
    &
    li750 /= li772
    &
    li750 /= li774
    &
    li750 /= li775
    &
    (
      li750 = lo752
      =>
      i750 = o752
    )
    &
    li750 /= lo754
    &
    (
      li750 = lo757
      =>
      i750 = o757
    )
    &
    (
      li750 = lo760
      =>
      i750 = o760
    )
    &
    li750 /= lo762
    &
    (
      li750 = lo765
      =>
      i750 = o765
    )
    &
    (
      li750 = lo768
      =>
      i750 = o768
    )
    &
    li750 /= lo770
    &
    (
      li750 = lo773
      =>
      i750 = o773
    )
    &
    (
      li750 = lo776
      =>
      i750 = o776
    )
    &
    li750 /= linput013set
    &
    li750 /= linput113set
    &
    li750 /= linput213set
    &
    (
      li750 = lovalue013boolean
      =>
      i750 = FALSE
    )
    &
    li751 /= li755
    &
    li751 /= li756
    &
    li751 /= li758
    &
    li751 /= li759
    &
    li751 /= li763
    &
    li751 /= li764
    &
    li751 /= li766
    &
    li751 /= li767
    &
    li751 /= li771
    &
    li751 /= li772
    &
    li751 /= li774
    &
    li751 /= li775
    &
    (
      li751 = lo752
      =>
      i751 = o752
    )
    &
    li751 /= lo754
    &
    (
      li751 = lo757
      =>
      i751 = o757
    )
    &
    (
      li751 = lo760
      =>
      i751 = o760
    )
    &
    li751 /= lo762
    &
    (
      li751 = lo765
      =>
      i751 = o765
    )
    &
    (
      li751 = lo768
      =>
      i751 = o768
    )
    &
    li751 /= lo770
    &
    (
      li751 = lo773
      =>
      i751 = o773
    )
    &
    (
      li751 = lo776
      =>
      i751 = o776
    )
    &
    li751 /= linput013set
    &
    li751 /= linput113set
    &
    li751 /= linput213set
    &
    (
      li751 = lovalue013boolean
      =>
      i751 = FALSE
    )
    &
    (
      li755 = li756
      =>
      i755 = i756
    )
    &
    (
      li755 = li758
      =>
      i755 = i758
    )
    &
    (
      li755 = li759
      =>
      i755 = i759
    )
    &
    (
      li755 = li763
      =>
      i755 = i763
    )
    &
    (
      li755 = li764
      =>
      i755 = i764
    )
    &
    (
      li755 = li766
      =>
      i755 = i766
    )
    &
    (
      li755 = li767
      =>
      i755 = i767
    )
    &
    (
      li755 = li771
      =>
      i755 = i771
    )
    &
    (
      li755 = li772
      =>
      i755 = i772
    )
    &
    (
      li755 = li774
      =>
      i755 = i774
    )
    &
    (
      li755 = li775
      =>
      i755 = i775
    )
    &
    li755 /= lo752
    &
    (
      li755 = lo754
      =>
      i755 = o754
    )
    &
    li755 /= lo757
    &
    li755 /= lo760
    &
    (
      li755 = lo762
      =>
      i755 = o762
    )
    &
    li755 /= lo765
    &
    li755 /= lo768
    &
    (
      li755 = lo770
      =>
      i755 = o770
    )
    &
    li755 /= lo773
    &
    li755 /= lo776
    &
    (
      li755 = linput013set
      =>
      i755 = {p3}
    )
    &
    (
      li755 = linput113set
      =>
      i755 = {p2}
    )
    &
    (
      li755 = linput213set
      =>
      i755 = {p1}
    )
    &
    li755 /= lovalue013boolean
    &
    (
      li756 = li758
      =>
      i756 = i758
    )
    &
    (
      li756 = li759
      =>
      i756 = i759
    )
    &
    (
      li756 = li763
      =>
      i756 = i763
    )
    &
    (
      li756 = li764
      =>
      i756 = i764
    )
    &
    (
      li756 = li766
      =>
      i756 = i766
    )
    &
    (
      li756 = li767
      =>
      i756 = i767
    )
    &
    (
      li756 = li771
      =>
      i756 = i771
    )
    &
    (
      li756 = li772
      =>
      i756 = i772
    )
    &
    (
      li756 = li774
      =>
      i756 = i774
    )
    &
    (
      li756 = li775
      =>
      i756 = i775
    )
    &
    li756 /= lo752
    &
    (
      li756 = lo754
      =>
      i756 = o754
    )
    &
    li756 /= lo757
    &
    li756 /= lo760
    &
    (
      li756 = lo762
      =>
      i756 = o762
    )
    &
    li756 /= lo765
    &
    li756 /= lo768
    &
    (
      li756 = lo770
      =>
      i756 = o770
    )
    &
    li756 /= lo773
    &
    li756 /= lo776
    &
    (
      li756 = linput013set
      =>
      i756 = {p3}
    )
    &
    (
      li756 = linput113set
      =>
      i756 = {p2}
    )
    &
    (
      li756 = linput213set
      =>
      i756 = {p1}
    )
    &
    li756 /= lovalue013boolean
    &
    (
      li758 = li759
      =>
      i758 = i759
    )
    &
    (
      li758 = li763
      =>
      i758 = i763
    )
    &
    (
      li758 = li764
      =>
      i758 = i764
    )
    &
    (
      li758 = li766
      =>
      i758 = i766
    )
    &
    (
      li758 = li767
      =>
      i758 = i767
    )
    &
    (
      li758 = li771
      =>
      i758 = i771
    )
    &
    (
      li758 = li772
      =>
      i758 = i772
    )
    &
    (
      li758 = li774
      =>
      i758 = i774
    )
    &
    (
      li758 = li775
      =>
      i758 = i775
    )
    &
    li758 /= lo752
    &
    (
      li758 = lo754
      =>
      i758 = o754
    )
    &
    li758 /= lo757
    &
    li758 /= lo760
    &
    (
      li758 = lo762
      =>
      i758 = o762
    )
    &
    li758 /= lo765
    &
    li758 /= lo768
    &
    (
      li758 = lo770
      =>
      i758 = o770
    )
    &
    li758 /= lo773
    &
    li758 /= lo776
    &
    (
      li758 = linput013set
      =>
      i758 = {p3}
    )
    &
    (
      li758 = linput113set
      =>
      i758 = {p2}
    )
    &
    (
      li758 = linput213set
      =>
      i758 = {p1}
    )
    &
    li758 /= lovalue013boolean
    &
    (
      li759 = li763
      =>
      i759 = i763
    )
    &
    (
      li759 = li764
      =>
      i759 = i764
    )
    &
    (
      li759 = li766
      =>
      i759 = i766
    )
    &
    (
      li759 = li767
      =>
      i759 = i767
    )
    &
    (
      li759 = li771
      =>
      i759 = i771
    )
    &
    (
      li759 = li772
      =>
      i759 = i772
    )
    &
    (
      li759 = li774
      =>
      i759 = i774
    )
    &
    (
      li759 = li775
      =>
      i759 = i775
    )
    &
    li759 /= lo752
    &
    (
      li759 = lo754
      =>
      i759 = o754
    )
    &
    li759 /= lo757
    &
    li759 /= lo760
    &
    (
      li759 = lo762
      =>
      i759 = o762
    )
    &
    li759 /= lo765
    &
    li759 /= lo768
    &
    (
      li759 = lo770
      =>
      i759 = o770
    )
    &
    li759 /= lo773
    &
    li759 /= lo776
    &
    (
      li759 = linput013set
      =>
      i759 = {p3}
    )
    &
    (
      li759 = linput113set
      =>
      i759 = {p2}
    )
    &
    (
      li759 = linput213set
      =>
      i759 = {p1}
    )
    &
    li759 /= lovalue013boolean
    &
    (
      li763 = li764
      =>
      i763 = i764
    )
    &
    (
      li763 = li766
      =>
      i763 = i766
    )
    &
    (
      li763 = li767
      =>
      i763 = i767
    )
    &
    (
      li763 = li771
      =>
      i763 = i771
    )
    &
    (
      li763 = li772
      =>
      i763 = i772
    )
    &
    (
      li763 = li774
      =>
      i763 = i774
    )
    &
    (
      li763 = li775
      =>
      i763 = i775
    )
    &
    li763 /= lo752
    &
    (
      li763 = lo754
      =>
      i763 = o754
    )
    &
    li763 /= lo757
    &
    li763 /= lo760
    &
    (
      li763 = lo762
      =>
      i763 = o762
    )
    &
    li763 /= lo765
    &
    li763 /= lo768
    &
    (
      li763 = lo770
      =>
      i763 = o770
    )
    &
    li763 /= lo773
    &
    li763 /= lo776
    &
    (
      li763 = linput013set
      =>
      i763 = {p3}
    )
    &
    (
      li763 = linput113set
      =>
      i763 = {p2}
    )
    &
    (
      li763 = linput213set
      =>
      i763 = {p1}
    )
    &
    li763 /= lovalue013boolean
    &
    (
      li764 = li766
      =>
      i764 = i766
    )
    &
    (
      li764 = li767
      =>
      i764 = i767
    )
    &
    (
      li764 = li771
      =>
      i764 = i771
    )
    &
    (
      li764 = li772
      =>
      i764 = i772
    )
    &
    (
      li764 = li774
      =>
      i764 = i774
    )
    &
    (
      li764 = li775
      =>
      i764 = i775
    )
    &
    li764 /= lo752
    &
    (
      li764 = lo754
      =>
      i764 = o754
    )
    &
    li764 /= lo757
    &
    li764 /= lo760
    &
    (
      li764 = lo762
      =>
      i764 = o762
    )
    &
    li764 /= lo765
    &
    li764 /= lo768
    &
    (
      li764 = lo770
      =>
      i764 = o770
    )
    &
    li764 /= lo773
    &
    li764 /= lo776
    &
    (
      li764 = linput013set
      =>
      i764 = {p3}
    )
    &
    (
      li764 = linput113set
      =>
      i764 = {p2}
    )
    &
    (
      li764 = linput213set
      =>
      i764 = {p1}
    )
    &
    li764 /= lovalue013boolean
    &
    (
      li766 = li767
      =>
      i766 = i767
    )
    &
    (
      li766 = li771
      =>
      i766 = i771
    )
    &
    (
      li766 = li772
      =>
      i766 = i772
    )
    &
    (
      li766 = li774
      =>
      i766 = i774
    )
    &
    (
      li766 = li775
      =>
      i766 = i775
    )
    &
    li766 /= lo752
    &
    (
      li766 = lo754
      =>
      i766 = o754
    )
    &
    li766 /= lo757
    &
    li766 /= lo760
    &
    (
      li766 = lo762
      =>
      i766 = o762
    )
    &
    li766 /= lo765
    &
    li766 /= lo768
    &
    (
      li766 = lo770
      =>
      i766 = o770
    )
    &
    li766 /= lo773
    &
    li766 /= lo776
    &
    (
      li766 = linput013set
      =>
      i766 = {p3}
    )
    &
    (
      li766 = linput113set
      =>
      i766 = {p2}
    )
    &
    (
      li766 = linput213set
      =>
      i766 = {p1}
    )
    &
    li766 /= lovalue013boolean
    &
    (
      li767 = li771
      =>
      i767 = i771
    )
    &
    (
      li767 = li772
      =>
      i767 = i772
    )
    &
    (
      li767 = li774
      =>
      i767 = i774
    )
    &
    (
      li767 = li775
      =>
      i767 = i775
    )
    &
    li767 /= lo752
    &
    (
      li767 = lo754
      =>
      i767 = o754
    )
    &
    li767 /= lo757
    &
    li767 /= lo760
    &
    (
      li767 = lo762
      =>
      i767 = o762
    )
    &
    li767 /= lo765
    &
    li767 /= lo768
    &
    (
      li767 = lo770
      =>
      i767 = o770
    )
    &
    li767 /= lo773
    &
    li767 /= lo776
    &
    (
      li767 = linput013set
      =>
      i767 = {p3}
    )
    &
    (
      li767 = linput113set
      =>
      i767 = {p2}
    )
    &
    (
      li767 = linput213set
      =>
      i767 = {p1}
    )
    &
    li767 /= lovalue013boolean
    &
    (
      li771 = li772
      =>
      i771 = i772
    )
    &
    (
      li771 = li774
      =>
      i771 = i774
    )
    &
    (
      li771 = li775
      =>
      i771 = i775
    )
    &
    li771 /= lo752
    &
    (
      li771 = lo754
      =>
      i771 = o754
    )
    &
    li771 /= lo757
    &
    li771 /= lo760
    &
    (
      li771 = lo762
      =>
      i771 = o762
    )
    &
    li771 /= lo765
    &
    li771 /= lo768
    &
    (
      li771 = lo770
      =>
      i771 = o770
    )
    &
    li771 /= lo773
    &
    li771 /= lo776
    &
    (
      li771 = linput013set
      =>
      i771 = {p3}
    )
    &
    (
      li771 = linput113set
      =>
      i771 = {p2}
    )
    &
    (
      li771 = linput213set
      =>
      i771 = {p1}
    )
    &
    li771 /= lovalue013boolean
    &
    (
      li772 = li774
      =>
      i772 = i774
    )
    &
    (
      li772 = li775
      =>
      i772 = i775
    )
    &
    li772 /= lo752
    &
    (
      li772 = lo754
      =>
      i772 = o754
    )
    &
    li772 /= lo757
    &
    li772 /= lo760
    &
    (
      li772 = lo762
      =>
      i772 = o762
    )
    &
    li772 /= lo765
    &
    li772 /= lo768
    &
    (
      li772 = lo770
      =>
      i772 = o770
    )
    &
    li772 /= lo773
    &
    li772 /= lo776
    &
    (
      li772 = linput013set
      =>
      i772 = {p3}
    )
    &
    (
      li772 = linput113set
      =>
      i772 = {p2}
    )
    &
    (
      li772 = linput213set
      =>
      i772 = {p1}
    )
    &
    li772 /= lovalue013boolean
    &
    (
      li774 = li775
      =>
      i774 = i775
    )
    &
    li774 /= lo752
    &
    (
      li774 = lo754
      =>
      i774 = o754
    )
    &
    li774 /= lo757
    &
    li774 /= lo760
    &
    (
      li774 = lo762
      =>
      i774 = o762
    )
    &
    li774 /= lo765
    &
    li774 /= lo768
    &
    (
      li774 = lo770
      =>
      i774 = o770
    )
    &
    li774 /= lo773
    &
    li774 /= lo776
    &
    (
      li774 = linput013set
      =>
      i774 = {p3}
    )
    &
    (
      li774 = linput113set
      =>
      i774 = {p2}
    )
    &
    (
      li774 = linput213set
      =>
      i774 = {p1}
    )
    &
    li774 /= lovalue013boolean
    &
    li775 /= lo752
    &
    (
      li775 = lo754
      =>
      i775 = o754
    )
    &
    li775 /= lo757
    &
    li775 /= lo760
    &
    (
      li775 = lo762
      =>
      i775 = o762
    )
    &
    li775 /= lo765
    &
    li775 /= lo768
    &
    (
      li775 = lo770
      =>
      i775 = o770
    )
    &
    li775 /= lo773
    &
    li775 /= lo776
    &
    (
      li775 = linput013set
      =>
      i775 = {p3}
    )
    &
    (
      li775 = linput113set
      =>
      i775 = {p2}
    )
    &
    (
      li775 = linput213set
      =>
      i775 = {p1}
    )
    &
    li775 /= lovalue013boolean
    &
    lo752 /= lo754
    &
    (
      lo752 = lo757
      =>
      o752 = o757
    )
    &
    (
      lo752 = lo760
      =>
      o752 = o760
    )
    &
    lo752 /= lo762
    &
    (
      lo752 = lo765
      =>
      o752 = o765
    )
    &
    (
      lo752 = lo768
      =>
      o752 = o768
    )
    &
    lo752 /= lo770
    &
    (
      lo752 = lo773
      =>
      o752 = o773
    )
    &
    (
      lo752 = lo776
      =>
      o752 = o776
    )
    &
    lo752 /= linput013set
    &
    lo752 /= linput113set
    &
    lo752 /= linput213set
    &
    (
      lo752 = lovalue013boolean
      =>
      o752 = FALSE
    )
    &
    lo754 /= lo757
    &
    lo754 /= lo760
    &
    (
      lo754 = lo762
      =>
      o754 = o762
    )
    &
    lo754 /= lo765
    &
    lo754 /= lo768
    &
    (
      lo754 = lo770
      =>
      o754 = o770
    )
    &
    lo754 /= lo773
    &
    lo754 /= lo776
    &
    (
      lo754 = linput013set
      =>
      o754 = {p3}
    )
    &
    (
      lo754 = linput113set
      =>
      o754 = {p2}
    )
    &
    (
      lo754 = linput213set
      =>
      o754 = {p1}
    )
    &
    lo754 /= lovalue013boolean
    &
    (
      lo757 = lo760
      =>
      o757 = o760
    )
    &
    lo757 /= lo762
    &
    (
      lo757 = lo765
      =>
      o757 = o765
    )
    &
    (
      lo757 = lo768
      =>
      o757 = o768
    )
    &
    lo757 /= lo770
    &
    (
      lo757 = lo773
      =>
      o757 = o773
    )
    &
    (
      lo757 = lo776
      =>
      o757 = o776
    )
    &
    lo757 /= linput013set
    &
    lo757 /= linput113set
    &
    lo757 /= linput213set
    &
    (
      lo757 = lovalue013boolean
      =>
      o757 = FALSE
    )
    &
    lo760 /= lo762
    &
    (
      lo760 = lo765
      =>
      o760 = o765
    )
    &
    (
      lo760 = lo768
      =>
      o760 = o768
    )
    &
    lo760 /= lo770
    &
    (
      lo760 = lo773
      =>
      o760 = o773
    )
    &
    (
      lo760 = lo776
      =>
      o760 = o776
    )
    &
    lo760 /= linput013set
    &
    lo760 /= linput113set
    &
    lo760 /= linput213set
    &
    (
      lo760 = lovalue013boolean
      =>
      o760 = FALSE
    )
    &
    lo762 /= lo765
    &
    lo762 /= lo768
    &
    (
      lo762 = lo770
      =>
      o762 = o770
    )
    &
    lo762 /= lo773
    &
    lo762 /= lo776
    &
    (
      lo762 = linput013set
      =>
      o762 = {p3}
    )
    &
    (
      lo762 = linput113set
      =>
      o762 = {p2}
    )
    &
    (
      lo762 = linput213set
      =>
      o762 = {p1}
    )
    &
    lo762 /= lovalue013boolean
    &
    (
      lo765 = lo768
      =>
      o765 = o768
    )
    &
    lo765 /= lo770
    &
    (
      lo765 = lo773
      =>
      o765 = o773
    )
    &
    (
      lo765 = lo776
      =>
      o765 = o776
    )
    &
    lo765 /= linput013set
    &
    lo765 /= linput113set
    &
    lo765 /= linput213set
    &
    (
      lo765 = lovalue013boolean
      =>
      o765 = FALSE
    )
    &
    lo768 /= lo770
    &
    (
      lo768 = lo773
      =>
      o768 = o773
    )
    &
    (
      lo768 = lo776
      =>
      o768 = o776
    )
    &
    lo768 /= linput013set
    &
    lo768 /= linput113set
    &
    lo768 /= linput213set
    &
    (
      lo768 = lovalue013boolean
      =>
      o768 = FALSE
    )
    &
    lo770 /= lo773
    &
    lo770 /= lo776
    &
    (
      lo770 = linput013set
      =>
      o770 = {p3}
    )
    &
    (
      lo770 = linput113set
      =>
      o770 = {p2}
    )
    &
    (
      lo770 = linput213set
      =>
      o770 = {p1}
    )
    &
    lo770 /= lovalue013boolean
    &
    (
      lo773 = lo776
      =>
      o773 = o776
    )
    &
    lo773 /= linput013set
    &
    lo773 /= linput113set
    &
    lo773 /= linput213set
    &
    (
      lo773 = lovalue013boolean
      =>
      o773 = FALSE
    )
    &
    lo776 /= linput013set
    &
    lo776 /= linput113set
    &
    lo776 /= linput213set
    &
    (
      lo776 = lovalue013boolean
      =>
      o776 = FALSE
    )
    &
    (
      linput013set = linput113set
      =>
      {p3} = {p2}
    )
    &
    (
      linput013set = linput213set
      =>
      {p3} = {p1}
    )
    &
    linput013set /= lovalue013boolean
    &
    (
      linput113set = linput213set
      =>
      {p2} = {p1}
    )
    &
    linput113set /= lovalue013boolean
    &
    linput213set /= lovalue013boolean
    &
    card(i755) <= 5
    &
    card(i756) <= 5
    &
    card(i758) <= 5
    &
    card(i759) <= 5
    &
    card(i763) <= 5
    &
    card(i764) <= 5
    &
    card(i766) <= 5
    &
    card(i767) <= 5
    &
    card(i771) <= 5
    &
    card(i772) <= 5
    &
    card(i774) <= 5
    &
    card(i775) <= 5
    &
    card(o754) <= 5
    &
    card(o762) <= 5
    &
    card(o770) <= 5
  )
)

END
