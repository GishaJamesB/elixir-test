import React, { useState, useEffect } from "react";
import 'react-bootstrap-table/dist/react-bootstrap-table.min.css'
import { Button, Form, Badge } from 'react-bootstrap';

export default function Home() {
  const [tweets, setTweets] = useState([])
  const [newTweet, setNewTweet] = useState('')

  useEffect(() => {
    getTweets()
  }, [])

  const submitTweets = () => {
    const requestOptions = {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ message: newTweet, user_id: 1 })
  };
    fetch('http://localhost:4000/api/tweets', requestOptions)
    setNewTweet('')
    getTweets()
  }

  const getTweets = async () => {
      const response = await fetch('http://localhost:4000/api/tweets');
      const info = await response.json();
      setTweets(info)
  };

  const handleChange = (event) => {
    setNewTweet(event.target.value)
  }

  return (
    <div>
      <Form.Group controlId="twitterForm">
        <Form.Label>Post your message</Form.Label>
        <Form.Control as="textarea" rows={3} onChange={handleChange} value={newTweet}  />
      </Form.Group>
      <Button variant="primary" onClick={submitTweets}>
        Submit
      </Button>
      <hr />

      {tweets.map((tweet, index) => (
        <div key={index}>
            {tweet.message} <br />
            <div className="">
              -- Posted by {tweet.posted_by} <br />
              <Badge variant="primary">Retweet</Badge>
            </div>
          <hr />
        </div>
      ))}
    </div>
  );
}