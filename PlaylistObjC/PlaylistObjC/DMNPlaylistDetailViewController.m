//
//  DMNPlaylistDetailViewController.m
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import "DMNPlaylistDetailViewController.h"
#import "DMNPlaylistController.h"

@interface DMNPlaylistDetailViewController ()

@property (nonatomic, weak) IBOutlet UITextField *titleTextField;
@property (nonatomic, weak) IBOutlet UITextField *artistTextField;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation DMNPlaylistDetailViewController

#pragma mark - Actions

- (IBAction)addButtonTapped:(id)sender
{
	[[DMNPlaylistController sharedInstance] addSongWithTitle:self.titleTextField.text andArtist:self.artistTextField.text toPlaylist:self.playlist];
	[self.tableView reloadData];
}

#pragma mark - UITableViewDataSource/Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.playlist.songs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songCell" forIndexPath:indexPath];
    DMNSong *song = self.playlist.songs[indexPath.row];
    cell.textLabel.text = song.title;
    cell.detailTextLabel.text = song.artist;
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        DMNSong *song = self.playlist.songs[indexPath.row];
        [[DMNPlaylistController sharedInstance] deleteSong:song fromPlaylist:self.playlist];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - Properties

- (void)setPlaylist:(DMNPlaylist *)playlist
{
	if (playlist != _playlist) {
		_playlist = playlist;
		[self.tableView reloadData];
	}
}

@end
