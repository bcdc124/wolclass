<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- <div class="h-100 bg-light rounded p-4"> -->
<!--                             <div class="d-flex align-items-center justify-content-between mb-4"> -->
<!--                                 <h6 class="mb-0">Calender</h6> -->
<!--                                 <a href="">Show All</a> -->
<!--                             </div> -->
<!--                             <div id="calender"><div class="bootstrap-datetimepicker-widget usetwentyfour"><ul class="list-unstyled"><li class="show"><div class="datepicker"><div class="datepicker-days" style=""><table class="table table-sm"><thead><tr><th class="prev" data-action="previous"><span class="fa fa-chevron-left" title="Previous Month"></span></th><th class="picker-switch" data-action="pickerSwitch" colspan="5" title="Select Month">May 2023</th><th class="next" data-action="next"><span class="fa fa-chevron-right" title="Next Month"></span></th></tr><tr><th class="dow">Su</th><th class="dow">Mo</th><th class="dow">Tu</th><th class="dow">We</th><th class="dow">Th</th><th class="dow">Fr</th><th class="dow">Sa</th></tr></thead><tbody><tr><td data-action="selectDay" data-day="04/30/2023" class="day old weekend">30</td><td data-action="selectDay" data-day="05/01/2023" class="day">1</td><td data-action="selectDay" data-day="05/02/2023" class="day">2</td><td data-action="selectDay" data-day="05/03/2023" class="day">3</td><td data-action="selectDay" data-day="05/04/2023" class="day">4</td><td data-action="selectDay" data-day="05/05/2023" class="day">5</td><td data-action="selectDay" data-day="05/06/2023" class="day weekend">6</td></tr><tr><td data-action="selectDay" data-day="05/07/2023" class="day weekend">7</td><td data-action="selectDay" data-day="05/08/2023" class="day">8</td><td data-action="selectDay" data-day="05/09/2023" class="day">9</td><td data-action="selectDay" data-day="05/10/2023" class="day">10</td><td data-action="selectDay" data-day="05/11/2023" class="day">11</td><td data-action="selectDay" data-day="05/12/2023" class="day">12</td><td data-action="selectDay" data-day="05/13/2023" class="day weekend">13</td></tr><tr><td data-action="selectDay" data-day="05/14/2023" class="day weekend">14</td><td data-action="selectDay" data-day="05/15/2023" class="day">15</td><td data-action="selectDay" data-day="05/16/2023" class="day active">16</td><td data-action="selectDay" data-day="05/17/2023" class="day">17</td><td data-action="selectDay" data-day="05/18/2023" class="day">18</td><td data-action="selectDay" data-day="05/19/2023" class="day">19</td><td data-action="selectDay" data-day="05/20/2023" class="day weekend">20</td></tr><tr><td data-action="selectDay" data-day="05/21/2023" class="day weekend">21</td><td data-action="selectDay" data-day="05/22/2023" class="day">22</td><td data-action="selectDay" data-day="05/23/2023" class="day">23</td><td data-action="selectDay" data-day="05/24/2023" class="day">24</td><td data-action="selectDay" data-day="05/25/2023" class="day">25</td><td data-action="selectDay" data-day="05/26/2023" class="day">26</td><td data-action="selectDay" data-day="05/27/2023" class="day weekend">27</td></tr><tr><td data-action="selectDay" data-day="05/28/2023" class="day weekend">28</td><td data-action="selectDay" data-day="05/29/2023" class="day">29</td><td data-action="selectDay" data-day="05/30/2023" class="day">30</td><td data-action="selectDay" data-day="05/31/2023" class="day">31</td><td data-action="selectDay" data-day="06/01/2023" class="day new">1</td><td data-action="selectDay" data-day="06/02/2023" class="day new">2</td><td data-action="selectDay" data-day="06/03/2023" class="day new weekend">3</td></tr><tr><td data-action="selectDay" data-day="06/04/2023" class="day new weekend">4</td><td data-action="selectDay" data-day="06/05/2023" class="day new">5</td><td data-action="selectDay" data-day="06/06/2023" class="day new">6</td><td data-action="selectDay" data-day="06/07/2023" class="day new">7</td><td data-action="selectDay" data-day="06/08/2023" class="day new">8</td><td data-action="selectDay" data-day="06/09/2023" class="day new">9</td><td data-action="selectDay" data-day="06/10/2023" class="day new weekend">10</td></tr></tbody></table></div><div class="datepicker-months" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev" data-action="previous"><span class="fa fa-chevron-left" title="Previous Year"></span></th><th class="picker-switch" data-action="pickerSwitch" colspan="5" title="Select Year">2023</th><th class="next" data-action="next"><span class="fa fa-chevron-right" title="Next Year"></span></th></tr></thead><tbody><tr><td colspan="7"><span data-action="selectMonth" class="month">Jan</span><span data-action="selectMonth" class="month">Feb</span><span data-action="selectMonth" class="month">Mar</span><span data-action="selectMonth" class="month">Apr</span><span data-action="selectMonth" class="month active">May</span><span data-action="selectMonth" class="month">Jun</span><span data-action="selectMonth" class="month">Jul</span><span data-action="selectMonth" class="month">Aug</span><span data-action="selectMonth" class="month">Sep</span><span data-action="selectMonth" class="month">Oct</span><span data-action="selectMonth" class="month">Nov</span><span data-action="selectMonth" class="month">Dec</span></td></tr></tbody></table></div><div class="datepicker-years" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev" data-action="previous"><span class="fa fa-chevron-left" title="Previous Decade"></span></th><th class="picker-switch" data-action="pickerSwitch" colspan="5" title="Select Decade">2020-2029</th><th class="next" data-action="next"><span class="fa fa-chevron-right" title="Next Decade"></span></th></tr></thead><tbody><tr><td colspan="7"><span data-action="selectYear" class="year old">2019</span><span data-action="selectYear" class="year">2020</span><span data-action="selectYear" class="year">2021</span><span data-action="selectYear" class="year">2022</span><span data-action="selectYear" class="year active">2023</span><span data-action="selectYear" class="year">2024</span><span data-action="selectYear" class="year">2025</span><span data-action="selectYear" class="year">2026</span><span data-action="selectYear" class="year">2027</span><span data-action="selectYear" class="year">2028</span><span data-action="selectYear" class="year">2029</span><span data-action="selectYear" class="year old">2030</span></td></tr></tbody></table></div><div class="datepicker-decades" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev" data-action="previous"><span class="fa fa-chevron-left" title="Previous Century"></span></th><th class="picker-switch" data-action="pickerSwitch" colspan="5">2000-2090</th><th class="next" data-action="next"><span class="fa fa-chevron-right" title="Next Century"></span></th></tr></thead><tbody><tr><td colspan="7"><span data-action="selectDecade" class="decade old" data-selection="2006">1990</span><span data-action="selectDecade" class="decade" data-selection="2006">2000</span><span data-action="selectDecade" class="decade" data-selection="2016">2010</span><span data-action="selectDecade" class="decade active" data-selection="2026">2020</span><span data-action="selectDecade" class="decade" data-selection="2036">2030</span><span data-action="selectDecade" class="decade" data-selection="2046">2040</span><span data-action="selectDecade" class="decade" data-selection="2056">2050</span><span data-action="selectDecade" class="decade" data-selection="2066">2060</span><span data-action="selectDecade" class="decade" data-selection="2076">2070</span><span data-action="selectDecade" class="decade" data-selection="2086">2080</span><span data-action="selectDecade" class="decade" data-selection="2096">2090</span><span data-action="selectDecade" class="decade old" data-selection="2106">2100</span></td></tr></tbody></table></div></div></li><li class="picker-switch accordion-toggle"></li></ul></div></div> -->
<!--                         </div> -->

<div class="datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top" style="top: 203.391px; left: 809px; z-index: 810; display: block;"><div class="datepicker-days" style=""><table class="table-condensed"><thead><tr><th colspan="7" class="datepicker-title" style="display: none;"></th></tr><tr><th class="prev">«</th><th colspan="5" class="datepicker-switch">February 2024</th><th class="next">»</th></tr><tr><th class="dow">Su</th><th class="dow">Mo</th><th class="dow">Tu</th><th class="dow">We</th><th class="dow">Th</th><th class="dow">Fr</th><th class="dow">Sa</th></tr></thead><tbody><tr><td class="old day" data-date="1706400000000">28</td><td class="old day" data-date="1706486400000">29</td><td class="old day" data-date="1706572800000">30</td><td class="old day" data-date="1706659200000">31</td><td class="day" data-date="1706745600000">1</td><td class="day" data-date="1706832000000">2</td><td class="day" data-date="1706918400000">3</td></tr><tr><td class="day" data-date="1707004800000">4</td><td class="day" data-date="1707091200000">5</td><td class="day" data-date="1707177600000">6</td><td class="day" data-date="1707264000000">7</td><td class="day" data-date="1707350400000">8</td><td class="day" data-date="1707436800000">9</td><td class="day" data-date="1707523200000">10</td></tr><tr><td class="day" data-date="1707609600000">11</td><td class="day" data-date="1707696000000">12</td><td class="day" data-date="1707782400000">13</td><td class="day" data-date="1707868800000">14</td><td class="day" data-date="1707955200000">15</td><td class="day" data-date="1708041600000">16</td><td class="day" data-date="1708128000000">17</td></tr><tr><td class="day" data-date="1708214400000">18</td><td class="day" data-date="1708300800000">19</td><td class="day" data-date="1708387200000">20</td><td class="day" data-date="1708473600000">21</td><td class="day" data-date="1708560000000">22</td><td class="day" data-date="1708646400000">23</td><td class="day" data-date="1708732800000">24</td></tr><tr><td class="day" data-date="1708819200000">25</td><td class="day" data-date="1708905600000">26</td><td class="day" data-date="1708992000000">27</td><td class="day" data-date="1709078400000">28</td><td class="day" data-date="1709164800000">29</td><td class="new day" data-date="1709251200000">1</td><td class="new day" data-date="1709337600000">2</td></tr><tr><td class="new day" data-date="1709424000000">3</td><td class="new day" data-date="1709510400000">4</td><td class="new day" data-date="1709596800000">5</td><td class="new day" data-date="1709683200000">6</td><td class="new day" data-date="1709769600000">7</td><td class="new day" data-date="1709856000000">8</td><td class="new day" data-date="1709942400000">9</td></tr></tbody><tfoot><tr><th colspan="7" class="today" style="display: none;">Today</th></tr><tr><th colspan="7" class="clear" style="display: none;">Clear</th></tr></tfoot></table></div><div class="datepicker-months" style="display: none;"><table class="table-condensed"><thead><tr><th colspan="7" class="datepicker-title" style="display: none;"></th></tr><tr><th class="prev">«</th><th colspan="5" class="datepicker-switch">2024</th><th class="next">»</th></tr></thead><tbody><tr><td colspan="7"><span class="month">Jan</span><span class="month focused">Feb</span><span class="month">Mar</span><span class="month">Apr</span><span class="month">May</span><span class="month">Jun</span><span class="month">Jul</span><span class="month">Aug</span><span class="month">Sep</span><span class="month">Oct</span><span class="month">Nov</span><span class="month">Dec</span></td></tr></tbody><tfoot><tr><th colspan="7" class="today" style="display: none;">Today</th></tr><tr><th colspan="7" class="clear" style="display: none;">Clear</th></tr></tfoot></table></div><div class="datepicker-years" style="display: none;"><table class="table-condensed"><thead><tr><th colspan="7" class="datepicker-title" style="display: none;"></th></tr><tr><th class="prev">«</th><th colspan="5" class="datepicker-switch">2020-2029</th><th class="next">»</th></tr></thead><tbody><tr><td colspan="7"><span class="year old">2019</span><span class="year">2020</span><span class="year">2021</span><span class="year">2022</span><span class="year active">2023</span><span class="year focused">2024</span><span class="year">2025</span><span class="year">2026</span><span class="year">2027</span><span class="year">2028</span><span class="year">2029</span><span class="year new">2030</span></td></tr></tbody><tfoot><tr><th colspan="7" class="today" style="display: none;">Today</th></tr><tr><th colspan="7" class="clear" style="display: none;">Clear</th></tr></tfoot></table></div><div class="datepicker-decades" style="display: none;"><table class="table-condensed"><thead><tr><th colspan="7" class="datepicker-title" style="display: none;"></th></tr><tr><th class="prev">«</th><th colspan="5" class="datepicker-switch">2000-2090</th><th class="next">»</th></tr></thead><tbody><tr><td colspan="7"><span class="decade old">1990</span><span class="decade">2000</span><span class="decade">2010</span><span class="decade active focused">2020</span><span class="decade">2030</span><span class="decade">2040</span><span class="decade">2050</span><span class="decade">2060</span><span class="decade">2070</span><span class="decade">2080</span><span class="decade">2090</span><span class="decade new">2100</span></td></tr></tbody><tfoot><tr><th colspan="7" class="today" style="display: none;">Today</th></tr><tr><th colspan="7" class="clear" style="display: none;">Clear</th></tr></tfoot></table></div><div class="datepicker-centuries" style="display: none;"><table class="table-condensed"><thead><tr><th colspan="7" class="datepicker-title" style="display: none;"></th></tr><tr><th class="prev">«</th><th colspan="5" class="datepicker-switch">2000-2900</th><th class="next">»</th></tr></thead><tbody><tr><td colspan="7"><span class="century old">1900</span><span class="century active focused">2000</span><span class="century">2100</span><span class="century">2200</span><span class="century">2300</span><span class="century">2400</span><span class="century">2500</span><span class="century">2600</span><span class="century">2700</span><span class="century">2800</span><span class="century">2900</span><span class="century new">3000</span></td></tr></tbody><tfoot><tr><th colspan="7" class="today" style="display: none;">Today</th></tr><tr><th colspan="7" class="clear" style="display: none;">Clear</th></tr></tfoot></table></div></div>
<%@ include file="../include/footer.jsp"%>