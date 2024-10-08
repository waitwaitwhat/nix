# Joe's dotfiles
# Copyright (C) 2023  Josep Jesus Bigorra Algaba (jjbigorra@gmail.com)

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

{ osConfig, ... }:
({ face, height ? null, heightSexp ? null
  , font ? osConfig.masterOptions.joe.sansFontFamily, inherits ? null
  , background ? null, backgroundSexp ? null, foreground ? null, weight ? null
  , italic ? null, box ? null, underline ? null }:

  let
    ifNullEmptyElse = x: tpl: if x == null then "" else tpl;
    height_ = if heightSexp == null then
      (ifNullEmptyElse height ":height (mk-font-size ${height})")
    else
      ":height ${heightSexp}";
    inherits_ = ifNullEmptyElse inherits
      ":inherit '(${builtins.concatStringsSep " " inherits})";
    foreground_ = ifNullEmptyElse foreground '':foreground "${foreground}"'';
    underline_ = ifNullEmptyElse underline '':underline "${underline}"'';
    background_ = if backgroundSexp == null then
      (ifNullEmptyElse background '':background "${background}"'')
    else
      ":background ${backgroundSexp}";
    weight_ = ifNullEmptyElse weight ":weight '${weight}";
    italic_ = ifNullEmptyElse italic ":italic t";
    box_ = ifNullEmptyElse box ":box ${box}";
    font_ = ifNullEmptyElse font '':font "${font}"'';
  in ''
    (set-face-attribute '${face} nil
        ${height_} ${weight_}
        ${font_} ${foreground_} ${background_} ${italic_} 
        ${box_} ${underline_} ${inherits_}
    )''

)
