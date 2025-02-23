<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Retrieve the existing session without creating a new one
    HttpSession mysession = request.getSession(false);

    // Check if session exists and contains user details
    if (mysession == null || mysession.getAttribute("email") == null || mysession.getAttribute("customer_id") == null) {
%>
    <script>
        alert("Session expired! Please log in again.");
        window.location.href = "login.jsp";
    </script>
<%
        return;
    }

    // Retrieve session attributes
    String email = (String) mysession.getAttribute("email");
    int customerId = (Integer) mysession.getAttribute("customer_id");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>5-Star Rating System with Message</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }

        .rating-container {
            display: flex;
            justify-content: center;
            gap: 5px;
            margin: 20px;
        }

        .stars {
            font-size: 30px;
            cursor: pointer;
            color: gray;
            transition: color 0.2s;
        }

        .selected {
            color: gold;
        }

        #message {
            width: 300px;
            height: 100px;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: none;
            font-size: 16px;
        }

        #submit-button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        #submit-button:hover {
            background-color: #0056b3;
        }

        #submit-button:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <h1>Share Your Experience</h1>
    <form action="review_submit.jsp" method="post" onsubmit="return validateForm()">
        <div class="rating-container">
            <span class="stars" data-rating="1">&#9733;</span>
            <span class="stars" data-rating="2">&#9733;</span>
            <span class="stars" data-rating="3">&#9733;</span>
            <span class="stars" data-rating="4">&#9733;</span>
            <span class="stars" data-rating="5">&#9733;</span>
        </div>

        <p>Your Rating: <span id="selected-rating">0</span> stars</p>

        <label for="message">Write a Review:</label><br>
        <textarea id="message" name="message" placeholder="Your review..." required></textarea>

        <!-- Hidden fields to send rating and user email -->
        <input type="hidden" id="rating" name="rating" value="0">
        <input type="hidden" name="customer_id" value="<%= customerId %>">
        <input type="hidden" name="email" value="<%= email %>"><br><br>

        <input type="submit" id="submit-button" value="Submit" disabled>
    </form>

    <script>
        const stars = document.querySelectorAll('.stars');
        const selectedRating = document.getElementById('selected-rating');
        const ratingInput = document.getElementById('rating');
        const messageInput = document.getElementById('message');
        const submitButton = document.getElementById('submit-button');

        let lastSelectedRating = 0;

        stars.forEach((star, index) => {
            star.addEventListener('mouseenter', () => {
                highlightStars(index + 1);
            });

            star.addEventListener('click', () => {
                lastSelectedRating = index + 1;
                ratingInput.value = lastSelectedRating;
                selectedRating.textContent = lastSelectedRating;
                highlightStars(lastSelectedRating);
                validateForm();
            });

            star.addEventListener('mouseleave', () => {
                highlightStars(lastSelectedRating);
            });
        });

        function highlightStars(rating) {
            stars.forEach((star, index) => {
                star.style.color = index < rating ? 'gold' : 'gray';
            });
        }

        function validateForm() {
            if (ratingInput.value !== "0" && messageInput.value.trim() !== "") {
                submitButton.removeAttribute("disabled");
                return true;
            } else {
                submitButton.setAttribute("disabled", "disabled");
                return false;
            }
        }

        messageInput.addEventListener("input", validateForm);
    </script>
</body>
</html>
