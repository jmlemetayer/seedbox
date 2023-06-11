#!/bin/bash -e

DOCUMENT_ROOT="/usr/local/apache2/htdocs"
INDEX_HTML="${DOCUMENT_ROOT=}/index.html"

# Generate the index.html file
cat > ${INDEX_HTML} <<-EOF
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://bootswatch.com/5/zephyr/bootstrap.min.css" rel="stylesheet">
		<title>${HOME_FQDN}</title>
	</head>
	<body class="vh-100">
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">${HOME_FQDN}</a>
			</div>
		</nav>
		<main role="main" class="container mt-5">
			<div class="list-group">
EOF

for NAME in $(echo ${HOME_LINKS} | sed 's/:/ /g')
do
	LINK=HOME_LINK_${NAME^^}

	cat >> ${INDEX_HTML} <<-EOF
		<a href="${!LINK}" class="list-group-item list-group-item-action">
			${NAME^}
		</a>
	EOF
done

cat >> ${INDEX_HTML} <<-EOF
			</div>
		</main>
	</body>
</html>
EOF

# Configure the access rights
chmod a+r ${INDEX_HTML}

# Launch the command
exec "$@"
