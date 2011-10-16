Tally
=====

Description
-----------

Requirements
------------

* `json`
* `data_mapper`
* `dm-sqlite-adapter`
* `dm-adjust`
* `sinatra`
* `rest_client`

Installation & Usage
-------------------

1.  Install the required gems on the server

        $ sudo gem install json sinatra data_mapper dm-sqlite-adapter dm-adjust

2.  Run the Tally server:

        $ bin/tally

    This will run tally from the in-built Sinatra 
    webserver. The tally directory also contains a `config.ru`
    file you can use with `rackup` if required.

3.  Browse to the Tally server at http://example.com:4567

Author
------

James Turnbull <james@lovedthanlost.net>

License
-------

    Author:: James Turnbull (<james@lovedthanlost.net>)
    Copyright:: Copyright (c) 2011 James Turnbull
    License:: Apache License, Version 2.0

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
