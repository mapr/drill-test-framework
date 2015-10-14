select flatten(events), flatten(events), e1, events from (select flatten(events) e1, events from `data.json`) sub where sub.e1.campaign_id = 'c2';
