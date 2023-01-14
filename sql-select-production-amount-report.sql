select t.plant,t.mat_code,jan.qty as jan,feb.qty as feb,mar.qty as mar,apr.qty as apr,may.qty as may,
jun.qty as jun,jul.qty as jul,aug.qty as aug,sep.qty as sep,oct.qty as oct,nov.qty as nov,dem.qty as dem
from fg_inout t
left join
(
      select mat_code,count(distinct sern) as qty from fg_inout
      where date_offline between to_date('2022-01-01','yyyy-mm-dd') and to_date('2022-02-01','yyyy-mm-dd')
      and plant = '9771'
      group by mat_code
) jan on t.mat_code = jan.mat_code
left join
(
      select mat_code,count(distinct sern) as qty from fg_inout
      where date_offline between to_date('2022-02-01','yyyy-mm-dd') and to_date('2022-03-01','yyyy-mm-dd')
      and plant = '9771'
      group by mat_code
) feb on t.mat_code = feb.mat_code
left join
(
      select mat_code,count(distinct sern) as qty from fg_inout
      where date_offline between to_date('2022-03-01','yyyy-mm-dd') and to_date('2022-04-01','yyyy-mm-dd')
      and plant = '9771'
      group by mat_code
) mar on t.mat_code = mar.mat_code
left join
(
      select mat_code,count(distinct sern) as qty from fg_inout
      where date_offline between to_date('2022-04-01','yyyy-mm-dd') and to_date('2022-05-01','yyyy-mm-dd')
      and plant = '9771'
      group by mat_code
) apr on t.mat_code = apr.mat_code
left join
(
      select mat_code,count(distinct sern) as qty from fg_inout
      where date_offline between to_date('2022-05-01','yyyy-mm-dd') and to_date('2022-06-01','yyyy-mm-dd')
      and plant = '9771'
      group by mat_code
) may on t.mat_code = may.mat_code
left join
(
      select mat_code,count(distinct sern) as qty from fg_inout
      where date_offline between to_date('2022-06-01','yyyy-mm-dd') and to_date('2022-07-01','yyyy-mm-dd')
      and plant = '9771'
      group by mat_code
) jun on t.mat_code = jun.mat_code
left join
(
      select mat_code,count(distinct sern) as qty from fg_inout
      where date_offline between to_date('2022-07-01','yyyy-mm-dd') and to_date('2022-08-01','yyyy-mm-dd')
      and plant = '9771'
      group by mat_code
) jul on t.mat_code = jul.mat_code
left join
(
      select mat_code,count(distinct sern) as qty from fg_inout
      where date_offline between to_date('2022-08-01','yyyy-mm-dd') and to_date('2022-09-01','yyyy-mm-dd')
      and plant = '9771'
      group by mat_code
) aug on t.mat_code = aug.mat_code
left join
(
      select mat_code,count(distinct sern) as qty from fg_inout
      where date_offline between to_date('2022-09-01','yyyy-mm-dd') and to_date('2022-10-01','yyyy-mm-dd')
      and plant = '9771'
      group by mat_code
) sep on t.mat_code = sep.mat_code
left join
(
      select mat_code,count(distinct sern) as qty from fg_inout
      where date_offline between to_date('2022-10-01','yyyy-mm-dd') and to_date('2022-11-01','yyyy-mm-dd')
      and plant = '9771'
      group by mat_code
) oct on t.mat_code = oct.mat_code
left join
(
      select mat_code,count(distinct sern) as qty from fg_inout
      where date_offline between to_date('2022-11-01','yyyy-mm-dd') and to_date('2022-12-01','yyyy-mm-dd')
      and plant = '9771'
      group by mat_code
) nov on t.mat_code = nov.mat_code
left join
(
      select mat_code,count(distinct sern) as qty from fg_inout
      where date_offline between to_date('2022-12-01','yyyy-mm-dd') and to_date('2022-12-31','yyyy-mm-dd')
      and plant = '9771'
      group by mat_code
) dem on t.mat_code = dem.mat_code
where t.plant = '9771'
group by t.plant,t.mat_code,jan.qty,feb.qty,mar.qty,apr.qty,may.qty,jun.qty,jul.qty,aug.qty,sep.qty,oct.qty,nov.qty,dem.qty
order by t.mat_code
