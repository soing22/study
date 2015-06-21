<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/CustomUtil" prefix="fnlb" %>
 
<!DOCTYPE HTML>
<html>
<head>
<META charset="UTF-8">
<title>[JUI Library] - JavaScript/Tooltip</title>

<link rel="stylesheet" href="../../../custom/menual.css" />
<link rel="stylesheet" href="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/jui.css" />
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/lib/jquery-1.8.0.min.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/lib/jquery.binder.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/base.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/core.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/ui/dropdown.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/ui/modal.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/uix/table.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/uix/xtable.js"></script>

<script>
paging_2 = paging("#paging_2", {
	pageCount: 100, 
	event: {
		page: function(pNo) {
			paging_2_xtable.page(pNo);
		}
	}
});

function paging2Run() {
	xtableRun();
	paging_2.reload(paging_2_xtable.count());
}

paging_2_xtable = xtable("#paging_2_xtable", {
	fields: [ "name", "age", "location" ],
	resize: true,
	sort: true,
	sortLoading: true,
	buffer: "s-page", // scroll, page, s-page
	bufferCount: 100,
	event: {
		sortend: function(data, e) {
			paging_2.first();
		}
	}
});
</script>
</head>
<body class="jui">









<div id="paging_2_xtable" class="xtable" style="padding-top: 26px; position: relative;">
			<div class="body" style="max-height: 200px; overflow-y: scroll; overflow-x: hidden;"><table class="table table-classic" style="position: relative; margin: 0px; border-bottom-width: 0px;">
				<thead>
					<tr style="height: 0px;">
						<th style="cursor: pointer; height: 0px; border-top-width: 0px !important; border-bottom-width: 0px !important; padding-top: 0px !important; padding-bottom: 0px !important; width: 228px;"></th>
						<th style="cursor: pointer; height: 0px; border-top-width: 0px !important; border-bottom-width: 0px !important; padding-top: 0px !important; padding-bottom: 0px !important; width: 228px;"></th>
						<th style="cursor: pointer; height: 0px; border-top-width: 0px !important; border-bottom-width: 0px !important; padding-top: 0px !important; padding-bottom: 0px !important; width: auto;"></th>
					</tr>
				</thead>
				<tbody>
			
		<tr>
				<td>Alvin0</td>
				<td>91</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin1</td>
				<td>42</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin2</td>
				<td>61</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin3</td>
				<td>73</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin4</td>
				<td>19</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin5</td>
				<td>1</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin6</td>
				<td>50</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin7</td>
				<td>9</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin8</td>
				<td>96</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin9</td>
				<td>74</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin10</td>
				<td>90</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin11</td>
				<td>30</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin12</td>
				<td>57</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin13</td>
				<td>99</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin14</td>
				<td>54</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin15</td>
				<td>93</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin16</td>
				<td>13</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin17</td>
				<td>43</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin18</td>
				<td>43</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin19</td>
				<td>16</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin20</td>
				<td>23</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin21</td>
				<td>40</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin22</td>
				<td>32</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin23</td>
				<td>57</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin24</td>
				<td>65</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin25</td>
				<td>17</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin26</td>
				<td>57</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin27</td>
				<td>64</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin28</td>
				<td>14</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin29</td>
				<td>33</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin30</td>
				<td>51</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin31</td>
				<td>66</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin32</td>
				<td>57</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin33</td>
				<td>74</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin34</td>
				<td>68</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin35</td>
				<td>82</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin36</td>
				<td>43</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin37</td>
				<td>17</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin38</td>
				<td>43</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin39</td>
				<td>44</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin40</td>
				<td>71</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin41</td>
				<td>92</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin42</td>
				<td>79</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin43</td>
				<td>22</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin44</td>
				<td>42</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin45</td>
				<td>67</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin46</td>
				<td>38</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin47</td>
				<td>9</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin48</td>
				<td>79</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin49</td>
				<td>29</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin50</td>
				<td>60</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin51</td>
				<td>23</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin52</td>
				<td>87</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin53</td>
				<td>68</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin54</td>
				<td>46</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin55</td>
				<td>82</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin56</td>
				<td>61</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin57</td>
				<td>82</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin58</td>
				<td>67</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin59</td>
				<td>38</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin60</td>
				<td>96</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin61</td>
				<td>8</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin62</td>
				<td>64</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin63</td>
				<td>73</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin64</td>
				<td>71</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin65</td>
				<td>81</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin66</td>
				<td>57</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin67</td>
				<td>16</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin68</td>
				<td>36</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin69</td>
				<td>87</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin70</td>
				<td>93</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin71</td>
				<td>66</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin72</td>
				<td>18</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin73</td>
				<td>19</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin74</td>
				<td>76</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin75</td>
				<td>16</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin76</td>
				<td>43</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin77</td>
				<td>4</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin78</td>
				<td>3</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin79</td>
				<td>32</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin80</td>
				<td>35</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin81</td>
				<td>18</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin82</td>
				<td>25</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin83</td>
				<td>29</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin84</td>
				<td>13</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin85</td>
				<td>60</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin86</td>
				<td>53</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin87</td>
				<td>17</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin88</td>
				<td>85</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin89</td>
				<td>70</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin90</td>
				<td>91</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin91</td>
				<td>93</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin92</td>
				<td>76</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin93</td>
				<td>12</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin94</td>
				<td>24</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin95</td>
				<td>80</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin96</td>
				<td>27</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin97</td>
				<td>29</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin98</td>
				<td>87</td>
				<td>LA</td>
			</tr><tr>
				<td>Alvin99</td>
				<td>61</td>
				<td>LA</td>
			</tr></tbody>
			</table></div>
		<table class="table table-classic head" style="position: absolute; top: 0px; border-bottom-width: 0px; margin: 0px;">
				<thead>
					<tr>
						<th style="cursor: pointer; width: 228px;">Name<div class="resize" style="position: absolute; width: 8px; height: 26px; left: 241px; top: 0px; cursor: w-resize; z-index: 1;"></div></th>
						<th style="cursor: pointer; width: 228px;">Age<div class="resize" style="position: absolute; width: 8px; height: 26px; left: 483px; top: 0px; cursor: w-resize; z-index: 1;"></div></th>
						<th style="cursor: pointer; width: auto;">Location</th>
					</tr>
				</thead>
				
			</table></div>
			
			<div id="paging_2" class="paging" style="margin-top: 3px;" onclick="paging_2();">
			<a href="#" class="prev">Previous</a>
			<div class="list">
			
				<a href="#" class="page active">1</a>
			
				<a href="#" class="page">2</a>
			
				<a href="#" class="page">3</a>
			
				<a href="#" class="page">4</a>
			
				<a href="#" class="page">5</a>
			
		</div>
			<a href="#" class="next">Next</a>
		</div>

</body>
</html>