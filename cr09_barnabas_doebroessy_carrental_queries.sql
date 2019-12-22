-- SELECT p.payment_id, c.name, invoice_id, payment_form
-- FROM payments p
-- JOIN payment_methods pm
	-- ON p.payment_method_id = pm.payment_id
-- JOIN clients c
	-- ON c.client_id = p.client_id


SELECT rent_id, c.name, r.location_end, l.station_name
FROM rent r
JOIN location l
	ON l.station_id = r.location_end
JOIN clients c
	ON c.client_id = r.client_id