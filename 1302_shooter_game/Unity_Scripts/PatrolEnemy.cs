using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
public class PatrolEnemy : EnemyBase {

    public Transform[] waypoints;
    private int nextWayPoint = 0;
    //private Transform player;
    private float firerate = 1f;
    private float firenexttime = 0;
    public AudioClip Fire;

    public Transform Spawnpoint;
    AudioSource Audio1;
    // Use this for initialization
    void Start ()
    {
        //player = GameObject.Find("Player").GetComponent<Transform>();
        Audio1 = GetComponent<AudioSource>();
	}
	
	// Update is called once per frame
    public override void move()
    {
        float distance = Vector3.Distance(transform.position, Player.position);

        if (distance <= 6.0f)
        {
            transform.position += transform.right * 3 * Time.deltaTime;
        }
        else
        {
            transform.LookAt(Player.position);
            transform.position += transform.forward * 4 * Time.deltaTime;
        }
    }



    public override void attack()
    {
        transform.LookAt(Player.position);

        if (Time.time > firenexttime)
        {
            firenexttime = Time.time + firerate;

            GameObject shoot = Instantiate(Resources.Load("EnemyBullet"), Spawnpoint.position, Spawnpoint.rotation) as GameObject;
            Rigidbody temp = shoot.GetComponent<Rigidbody>();
            temp.AddForce(shoot.transform.forward * 1500);

            //Audio1.PlayOneShot(Fire, 0.8f);
        }

    }
}
