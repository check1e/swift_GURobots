/*
 * SoccerSightings.swift
 * GURobots
 *
 * Created by Callum McColl on 26/7/20.
 * Copyright © 2020 Callum McColl. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials
 *    provided with the distribution.
 *
 * 3. All advertising materials mentioning features or use of this
 *    software must display the following acknowledgement:
 *
 *        This product includes software developed by Callum McColl.
 *
 * 4. Neither the name of the author nor the names of contributors
 *    may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
 * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * -----------------------------------------------------------------------
 * This program is free software; you can redistribute it and/or
 * modify it under the above terms or under the terms of the GNU
 * General Public License as published by the Free Software Foundation;
 * either version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/licenses/
 * or write to the Free Software Foundation, Inc., 51 Franklin Street,
 * Fifth Floor, Boston, MA  02110-1301, USA.
 *
 */

import CGURobots
import GUCoordinates

/// Contains the locations on the soccer field in relation from a source point.
///
/// The sightings contained within this struct are stored in relation to some
/// other object (usually the robot). As such, these sightings are only
/// available if the robot can actually see them. These sightings are typically
/// created by querying the messages posted by the Kalman Filter in the
/// whiteboard.
public struct SoccerSightings: CTypeWrapper {
    
// MARK: - Properties
    
    /// The location of the ball.
    public var ball: RelativeCoordinate?
    
    /// The location of the left goal post.
    ///
    /// Note that the only left goal post being reported is the one that is
    /// currently being seen, or that has last been seen.
    public var leftGoalPost: RelativeCoordinate?
    
    /// The location of the right goal post.
    ///
    /// Note that the only right goal post being reported is the one that is
    /// currently being seen, or that has last been seen.
    public var rightGoalPost: RelativeCoordinate?
    
    /// The location of the right goal post.
    ///
    /// Note that the only goal being reported is the one that is
    /// currently being seen, or that has last been seen.
    public var goal: RelativeCoordinate?
    
// MARK: - Converting Between The Underlying gurobots C Type
    
    /// Convert to the underlying gurobots C type `gu_soccer_sightings`.
    public var rawValue: gu_soccer_sightings {
        return gu_soccer_sightings(
            ball: gu_optional_relative_coordinate(has_value: self.ball != nil, value: self.ball?.rawValue ?? gu_relative_coordinate()),
            leftGoalPost: gu_optional_relative_coordinate(has_value: self.leftGoalPost != nil, value: self.leftGoalPost?.rawValue ?? gu_relative_coordinate()),
            rightGoalPost: gu_optional_relative_coordinate(has_value: self.rightGoalPost != nil, value: self.rightGoalPost?.rawValue ?? gu_relative_coordinate()),
            goal: gu_optional_relative_coordinate(has_value: self.goal != nil, value: self.goal?.rawValue ?? gu_relative_coordinate()))
    }
    
    /// Create a SoccerSightings by copying the values from the underlying
    /// gurobots C type `gu_soccer_sightings`.
    ///
    /// - Parameter other: The underlying gurobots C type `gu_soccer_sightings`
    /// that contains the values that will be copied.
    public init(_ other: gu_soccer_sightings) {
        self.init(
            ball: other.ball.has_value ? RelativeCoordinate(other.ball.value) : nil,
            leftGoalPost: other.leftGoalPost.has_value ? RelativeCoordinate(other.leftGoalPost.value) : nil,
            rightGoalPost: other.rightGoalPost.has_value ? RelativeCoordinate(other.rightGoalPost.value) : nil,
            goal: other.goal.has_value ? RelativeCoordinate(other.goal.value) : nil
        )
    }
    
// MARK: - Creating SoccerSightings
    
    /// Create a SoccerSightings.
    ///
    /// - Parameter ball: The location of the ball.
    ///
    /// - Parameter leftGoalPost: The location of the left goal post.
    ///
    /// - Parameter rightGoalPost: The location of the right goal post.
    ///
    /// - Parmaeter goal: The location of the goal.
    public init(ball: RelativeCoordinate? = nil, leftGoalPost: RelativeCoordinate? = nil, rightGoalPost: RelativeCoordinate? = nil, goal: RelativeCoordinate? = nil) {
        self.ball = ball
        self.leftGoalPost = leftGoalPost
        self.rightGoalPost = rightGoalPost
        self.goal = goal
    }
    
}
