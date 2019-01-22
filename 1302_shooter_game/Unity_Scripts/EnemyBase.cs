using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.SceneManagement;

public class EnemyBase : MonoBehaviour {

    static public float speed;
    static public float hp;
    static public Transform Player;
    static public Transform Enemy;
    static public Rigidbody Bullet;
    static public float distance;
    static public Transform Spawnpoint;



	// Use this for initialization
	protected void Start ()
    {
        Player = GameObject.Find("Player").GetComponent<Transform>();

	}

    // Update is called once per frame
    void Update()
    {
    }

    public void checkForAttack() {
        
        distance = Vector3.Distance(transform.position, Player.position);

        if (distance < 10)
        {
            attack();
        }
    }

    private void OnCollisionEnter(Collision collision)
    {
        if(collision.gameObject.tag == "Player")
        {
            
            //kill the player
            SceneManager.LoadScene(0);
        }
    }

    public void TakeDamage(int amount)
    {
        hp -= amount;
     
        if (hp <= 0)
        {
          Destroy(gameObject);
           
        }
    }
    public virtual void attack()
    {

    }
    public virtual void move()
    {

    }
}
