<div id="container" class="row">
{include file="./includes/_errors.tpl"}
<ul class="nav nav-tabs">
    <li role="presentation" class="active"><a href="#">{'home_bp_dashboard_menu'|m62Lang}</a></li>
    <li role="presentation"><a href="#">{'files_bp_dashboard_menu'|m62Lang}</a></li>
    <li role="presentation"><a href="#">{'db_bp_dashboard_menu'|m62Lang}</a></li>
</ul>
		<div class="panel">
												<div>
			<div class="panel-heading"><i class="icon-dashboard"></i> Stats Dashboard</div>
			
			<form id="granularity" action="index.php?controller=AdminStats&amp;module=statsforecast&amp;token=fa9a569a26404a309e6617d8a37f38df#granularity" method="post" class="form-horizontal">
				<div class="row row-margin-bottom">
					<label class="control-label col-lg-3">
						Time frame
					</label>
					<div class="col-lg-2">
						<input type="hidden" name="submitGranularity" value="1" />
						<select name="stats_granularity" onchange="this.form.submit();">
							<option value="10">Daily</option>
							<option value="42" >Weekly</option>
							<option value="7" >Monthly</option>
							<option value="4" >Yearly</option>
						</select>
					</div>
				</div>
			</form>

			<table class="table">
				<thead>
					<tr>
						<th></th>
						<th class="text-center"><span class="title_box active">Visits</span></th>
						<th class="text-center"><span class="title_box active">Registrations</span></th>
						<th class="text-center"><span class="title_box active">Placed orders</span></th>
						<th class="text-center"><span class="title_box active">Bought items</span></th>
						<th class="text-center"><span class="title_box active">Percentage of registrations</span></th>
						<th class="text-center"><span class="title_box active">Percentage of orders</span></th>
						<th class="text-center"><span class="title_box active">Revenue</span></th>
					</tr>
				</thead>
			<tr>
				<td>2015-11-12</td>
				<td class="text-center">3</td>
				<td class="text-center">1</td>
				<td class="text-center">0</td>
				<td class="text-center">0</td>
				<td class="text-center">33.33 %</td>
				<td class="text-center">0 %</td>
				<td class="text-right">$0.00</td>
			</tr>
			<tr>
				<td>2015-11-13</td>
				<td class="text-center">0</td>
				<td class="text-center">0</td>
				<td class="text-center">0</td>
				<td class="text-center">0</td>
				<td class="text-center">-</td>
				<td class="text-center">-</td>
				<td class="text-right">$0.00</td>
			</tr>
				<tr>
					<th></th>
					<th class="text-center"><span class="title_box active">Visits</span></th>
					<th class="text-center"><span class="title_box active">Registrations</span></th>
					<th class="text-center"><span class="title_box active">Placed orders</span></th>
					<th class="text-center"><span class="title_box active">Bought items</span></th>
					<th class="text-center"><span class="title_box active">Percentage of registrations</span></th>
					<th class="text-center"><span class="title_box active">Percentage of orders</span></th>
					<th class="text-center"><span class="title_box active">Revenue</span></th>
				</tr>
				<tr>
					<td>Total</td>
					<td class="text-center">3</td>
					<td class="text-center">1</td>
					<td class="text-center">0</td>
					<td class="text-center">0</td>
					<td class="text-center">--</td>
					<td class="text-center">--</td>
					<td class="text-right">$0.00</td>
				</tr>
				<tr>
					<td>Average</td>
					<td class="text-center">1</td>
					<td class="text-center">0</td>
					<td class="text-center">0</td>
					<td class="text-center">0</td>
					<td class="text-center">33.33 %</td>
					<td class="text-center">0 %</td>
					<td class="text-right">$0.00</td>
				</tr>
				<tr>
					<td>Forecast</td>
					<td class="text-center">31</td>
					<td class="text-center">10</td>
					<td class="text-center">0</td>
					<td class="text-center">0</td>
					<td class="text-center">--</td>
					<td class="text-center">--</td>
					<td class="text-right">$0.00</td>
				</tr>
			</table>
		</div>
		<div class="row row-margin-bottom">
			<h4><i class="icon-filter"></i> Conversion</h4>
		</div>
		<div class="row row-margin-bottom">
			<table class="table">
				<tbody>
					<tr>
						<td rowspan="2" class="text-center">
							<p>Visitors</p>
							<p>2</p>
						</td>
						<td class="text-center">
							<p><i class="icon-chevron-right"></i></p>
							<p>50 %</p>
						</td>
						<td class="text-center">
							<p>Accounts</p>
							<p>1</p>
						</td>
						<td class="text-center">
							<p><i class="icon-chevron-right"></i></p>
							<p>500 %</p>
						</td>
						<td rowspan="2" class="text-center">
							<p>Full carts</p>
							<p>5</p>
						</td>
						<td rowspan="2" class="text-center">
							<p><i class="icon-chevron-right"></i></p>
							<p>0 %</p>
						</td>
						<td rowspan="2" class="text-center">
							<p>Orders</p>
							<p>0</p>
						</td>
						<td rowspan="2" class="text-center">
							<p>Registered visitors</p>
						</td>
						<td rowspan="2" class="text-center">
							<i class="icon-chevron-right"></i>
						</td>
						<td rowspan="2" class="text-center">
							<p>0 %</p>
						</td>
						<td rowspan="2" class="text-center">
							<i class="icon-chevron-right"></i>
						</td>
						<td rowspan="2" class="text-center">
							<p>Orders</p>
						</td>
						<td rowspan="2" class="text-center">
							<p>Visitors</p>
						</td>
						<td rowspan="2" class="text-center">
							<i class="icon-chevron-right"></i>
						</td>
						<td rowspan="2" class="text-center">
							<p>0 %</p>
						</td>
						<td rowspan="2" class="center">
							<i class="icon-chevron-right"></i>
						</td>
						<td rowspan="2" class="text-center">
							<p>Orders</p>
						</td>
					</tr>
					<tr>
						<td class="text-center">
							<p><i class="icon-chevron-right"></i></p>
							<p>250 %</p>
						</td>
						<td class="text-center">
							<p>Carts</p>
							<p>5</p>
						</td>
						<td class="text-center">
							<p><i class="icon-chevron-right"></i></p>
							<p>100 %</p>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="alert alert-info">
			<p>A simple statistical calculation lets you know the monetary value of your visitors:</p>
			<p>On average, each visitor places an order for this amount: <b>$0.00.</b></p>
			<p>On average, each registered visitor places an order for this amount: <b>$0.00</b>.</p>
		</div>
			<div class="row row-margin-bottom">
				<h4><i class="icon-money"></i> Payment distribution</h4>
				<div class="alert alert-info">The amounts include taxes, so you can get an estimation of the commission due to the payment method.
				</div>
				<form id="cat" action="index.php?controller=AdminStats&amp;module=statsforecast&amp;token=fa9a569a26404a309e6617d8a37f38df#payment" method="post" class="form-horizontal">
					<div class="row row-margin-bottom">
						<label class="control-label col-lg-3">
							Zone:
						</label>
						<div class="col-lg-3">
							<input type="hidden" name="submitIdZone" value="1" />
							<select name="stats_id_zone" onchange="this.form.submit();">
								<option value="0">-- No filter --</option><option value="4" >Africa</option><option value="3" >Asia</option><option value="8" >Central America/Antilla</option><option value="1" >Europe</option><option value="7" >Europe (non-EU)</option><option value="2" >North America</option><option value="5" >Oceania</option><option value="6" >South America</option>
							</select>
						</div>
					</div>
				</form>
				<table class="table">
					<thead>
						<tr>
							<th class="text-center"><span class="title_box active">Module</span></th>
							<th class="text-center"><span class="title_box active">Orders</span></th>
							<th class="text-center"><span class="title_box active">Sales</span></th>
							<th class="text-center"><span class="title_box active">Average cart value</span></th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div class="row row-margin-bottom">
				<h4><i class="icon-sitemap"></i> Category distribution</h4>
				<form id="cat_1" action="index.php?controller=AdminStats&amp;module=statsforecast&amp;token=fa9a569a26404a309e6617d8a37f38df#cat" method="post" class="form-horizontal">
					<div class="row row-margin-bottom">
						<label class="control-label col-lg-3">
							Zone
						</label>
						<div class="col-lg-3">
							<input type="hidden" name="submitIdZone" value="1" />
							<select name="stats_id_zone" onchange="this.form.submit();">
								<option value="0">-- No filter --</option><option value="4" >Africa</option><option value="3" >Asia</option><option value="8" >Central America/Antilla</option><option value="1" >Europe</option><option value="7" >Europe (non-EU)</option><option value="2" >North America</option><option value="5" >Oceania</option><option value="6" >South America</option>
							</select>
						</div>
					</div>
				</form>
				<table class="table">
					<thead>
						<tr>
							<th class="text-center"><span class="title_box active">Category</span></th>
							<th class="text-center"><span class="title_box active">Products sold</span></th>
							<th class="text-center"><span class="title_box active">Sales</span></th>
							<th class="text-center"><span class="title_box active">Percentage of products sold</span></th>
							<th class="text-center"><span class="title_box active">Percentage of sales</span></th>
							<th class="text-center"><span class="title_box active">Average price</span></th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div class="row row-margin-bottom">
				<h4><i class="icon-flag"></i> Language distribution</h4>
				<table class="table">
					<thead>
						<tr>
							<th class="text-center"><span class="title_box active">Language</span></th>
							<th class="text-center"><span class="title_box active">Sales</span></th>
							<th class="text-center"><span class="title_box active">Percentage</span></th>
							<th class="text-center" colspan="2"><span class="title_box active">Growth</span></th>
						</tr>
					</thead>
					<tbody>
					<tr >
						<td class="text-center">en</td>
						<td class="text-right"></td>
						<td class="text-center">-</td>
						<td class="text-center"><img src="../img/admin/arrow_up.png" alt="" /></td>
						<td class="text-center">+&#x221e;%</td>
					</tr>
					</tbody>
				</table>
			</div>
			<div class="row row-margin-bottom">
				<h4><i class="icon-map-marker"></i> Zone distribution</h4>
				<table class="table">
					<thead>
						<tr>
							<th class="text-center"><span class="title_box active">Zone</span></th>
							<th class="text-center"><span class="title_box active">Orders</span></th>
							<th class="text-center"><span class="title_box active">Sales</span></th>
							<th class="text-center"><span class="title_box active">Percentage of orders</span></th>
							<th class="text-center"><span class="title_box active">Percentage of sales</span></th>
						</tr>
					</thead>
					<tbody>
					</tbody> 
				</table>
			</div>
			<div class="row row-margin-bottom">
				<h4><i class="icon-money"></i> Currency distribution</h4>
				<form id="cat_2" action="index.php?controller=AdminStats&amp;module=statsforecast&amp;token=fa9a569a26404a309e6617d8a37f38df#currencies" method="post" class="form-horizontal">
					<div class="row row-margin-bottom">
						<label class="control-label col-lg-3">
							Zone:
						</label>
						<div class="col-lg-3">
							<input type="hidden" name="submitIdZone" value="1" />
							<select name="stats_id_zone" onchange="this.form.submit();">
								<option value="0">-- No filter --</option><option value="4" >Africa</option><option value="3" >Asia</option><option value="8" >Central America/Antilla</option><option value="1" >Europe</option><option value="7" >Europe (non-EU)</option><option value="2" >North America</option><option value="5" >Oceania</option><option value="6" >South America</option>
							</select>
						</div>
					</div>
				</form>
				<table class="table">
					<thead>
						<tr>
							<th class="text-center"><span class="title_box active">Currency</span></th>
							<th class="text-center"><span class="title_box active">Orders</span></th>
							<th class="text-right"><span class="title_box active">Sales (converted)</span></th>
							<th class="text-center"><span class="title_box active">Percentage of orders</span></th>
							<th class="text-center"><span class="title_box active">Percentage of sales</span></th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div class="row row-margin-bottom">
				<h4><i class="icon-ticket"></i> Attribute distribution</h4>
				<table class="table">
					<thead>
						<tr>
							<th class="text-center"><span class="title_box active">Group</span></th>
							<th class="text-center"><span class="title_box active">Attribute</span></th>
							<th class="text-center"><span class="title_box active">Quantity of products sold</span></th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
									</div>
	</div>
</div>
			</div>
</div>

	</div>
</div>