//
//  Song.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Song: Equatable {
    init(name: String, artist: String) {
        self.name = name
        self.artist = artist
    }
	
	let name: String
	let artist: String
}

func ==(lhs: Song, rhs: Song) -> Bool {
    return lhs.name == rhs.name && lhs.artist == rhs.artist
}