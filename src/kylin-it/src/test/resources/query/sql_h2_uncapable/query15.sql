-- Licensed to the Apache Software Foundation (ASF) under one or more
-- contributor license agreements.  See the NOTICE file distributed with
-- this work for additional information regarding copyright ownership.
-- The ASF licenses this file to You under the Apache License, Version 2.0
-- (the "License"); you may not use this file except in compliance with
-- the License.  You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

-- why it need add floor fun?
-- for the calcite plan for avg is CAST(/(CAST(Sum(col)):INTEGER, count(col))):INTEGER), so it returns a int value
-- but calcite gets a float value
select CAL_DT, floor(avg(PRICE)), count(*) over() COU,
first_value(timestamp '1970-01-01 10:10:10') over() TMP, max(date '1970-01-01') over() DAT
from TEST_KYLIN_FACT
where CAL_DT > date'2013-12-30'
group by CAL_DT
order by CAL_DT