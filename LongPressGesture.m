- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
        reuseIdentifier:@"Cell"] autorelease];
    }

    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                     initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 1.0; //seconds
    [cell addGestureRecognizer:lpgr];

    [self configureCell:cell atIndexPath:indexPath];

    return cell;
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
            CGPoint p = [gestureRecognizer locationInView:self.tableView];

            NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:p];
            if (indexPath == nil)
               NSLog(@"long press on table view but not on a row");
            else
            {
                 if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
                     NSLog(@"UIGestureRecognizerStateEnded");
                     //Do Whatever You want on End of Gesture
                 }
                 else if (gestureRecognizer.state == UIGestureRecognizerStateBegan){

                     UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Announcement" message: @"You have long-pressed the row...!" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                     [alert show];
                     NSLog(@"UIGestureRecognizerStateBegan.");


                     NSLog(@"long press on table view at row %d", indexPath.row);

                     // Update ToDoStatus
                    [self.tableView reloadData];
                    //Do Whatever You want on Began of Gesture
                 }
            }
}
