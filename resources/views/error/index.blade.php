<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error: 404</title>
    <style>
        body {
            display: flex;
            font-family: Arial, Helvetica, sans-serif;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(to right, #040043ff, #39004eff);
            color: white;
            font-family: Arial, sans-serif;
            text-align: center;
        }
        h1 {
            font-size: 3em;
            margin-bottom: 20px;
        }
        p {
            font-size: 1.5em;
            margin-bottom: 30px;
        }
        a {
            padding: 10px 20px;
            background-color: #4a90e2;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #357ab8;
        }
        @media (max-width: 600px) {
            h1 {
                font-size: 2em; 
            }
            p {
                font-size: 1em; 
            }
            a {
                padding: 8px 16px; 
            }
        }
    </style>
</head>
<body>
    <h1>404 Not Found</h1>
    <p>The URL you are trying to access does not exist.</p>
    <a href="{{ url('/s-app') }}">Back to home</a>
</body>
@include('components.footer')
</html>
